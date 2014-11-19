//
//  FKRootViewController.m
//  Weather
//
//  Created by yeeku on 13-10-6.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKRootViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "FKASIHTTPRequestUtil.h"
#import "GDataXMLNode.h"
#import "FKProvincesViewController.h"
#import "FKForecastViewController.h"

#define getWeatherbyCityName @"http://www.webxml.com.cn/WebServices/WeatherWebService.asmx/getWeatherbyCityName"
#define theCityName @"theCityName"
@interface FKRootViewController ()
// 定义一个NSMutableArray集合，用于缓存当前系统需要显示天气的城市列表
@property(strong,nonatomic) NSMutableArray *cityData;
// 定义一个NSMutableDictionary集合，用于缓存从服务器下载得到天气数据
@property(strong,nonatomic) NSMutableDictionary *weatherData;
@end

@implementation FKRootViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
	self.title = @"天气预报";
	// 自定义颜色
	UIColor *customColor= [UIColor colorWithRed:48/255.0 green:67/255.0
		blue:97/255.0 alpha:0.8];
	// 如果保存城市列表的属性列表文件不存在
	if(![[NSFileManager defaultManager] fileExistsAtPath:self.filePath])
	{
		// 默认只显示广州的天气
		self.cityData = [NSMutableArray arrayWithObject:@"广州"];
	}
	else
	{
		// 如果保存城市列表的属性列表文件存在，直接显示该属性列表文件中的所有城市
		self.cityData = [NSMutableArray arrayWithContentsOfFile:self.filePath];
	}
	// 创建weatherData集合，用于缓存已经从服务器下载的天气数据
	self.weatherData = [[NSMutableDictionary alloc] init];
	self.tableView.scrollEnabled = NO;  // 设置不可滚动
	self.tableView.backgroundColor = customColor;  // 设置自定义背景
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
}
- (NSInteger)tableView:(UITableView *)tableView
	numberOfRowsInSection:(NSInteger)section
{
	return self.cityData.count;
}
// 该方法的返回值用于控制每个表格行的高度
- (CGFloat)tableView:(UITableView *)tableView
	heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
	cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 定义静态单元格原型的Identifier
	static NSString *cellId = @"weatherCell";
	// 获取可重用的单元格
	UITableViewCell *cell = [self.tableView
		dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
	// 为单元格设置圆角边框
	cell.layer.cornerRadius = 8;
	cell.layer.masksToBounds = YES;
	// 根据当前行号获取对应的城市
	NSString *city = [self.cityData objectAtIndex:indexPath.row];
	// 创建FKASIHTTPRequestUtil的对象
	FKASIHTTPRequestUtil *FKASIUtil = [[FKASIHTTPRequestUtil alloc] init];
	// 调用 synchronousRequest方法根据城市名称获取城市的天气信息,返回的是一个xml格式的字符串
	NSString *responseString = [FKASIUtil synchronousRequest:getWeatherbyCityName
		paramName:theCityName paramValue:city];
	// 从远程服务器获取数据 ，免费用户二次获取数据时间要超过600ms，所以此处暂停0.7秒
	[NSThread sleepForTimeInterval:0.7];
	/*
	 返回的responseString为如下格式的字符串
	 <string>广东</string>
	 <string>广州</string>
	 <string>59287</string>
	 <string>59287.jpg</string>
	 <string>2013-6-11 14:20:59</string>
	 <string>22℃/27℃</string>
	 <string>6月11日 阵雨</string>
	 <string>无持续风向微风</string>
	 <string>3.gif</string>
	 <string>3.gif</string>
	 <string>今日天气实况：气温：23℃；风向/风力：北风 3级；湿度：85%；空气质量：良；
	紫外线强度：弱</string>
	 */
	if(responseString != nil)
	{
		// 依次添加每个城市的天气情况
		[self.weatherData setObject:responseString forKey:city];
		// 根据responseString获取一个XML Document
		GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithXMLString:responseString options:1 error:nil];
		// 获取根节点对象
		GDataXMLElement *rootElement = [doc rootElement];
		// 获取<string.../>子元素，返回NSArray对象
		NSArray *dataElements = [rootElement elementsForName:@"string"];
		// 获取显示城市名称的UILabel，并设置城市名。
		UILabel* cityNameLabel = (UILabel*)[cell viewWithTag:1];
		cityNameLabel.text = city;
		// 获取显示天气图标的UIImageView，并设置显示图片
		UIImageView* weatherIv = (UIImageView*)[cell viewWithTag:3];
		weatherIv.image = [UIImage imageNamed:[NSString stringWithFormat:
			@"b_%@" , [[dataElements objectAtIndex:8] stringValue]]];
		// 索引为10的<string.../>的内容如下：
		// 今日天气实况：气温：26℃；风向/风力：西北风 2级；湿度：98%；空气质量：良；紫外线强度：中等
		// 使用substringFromIndex:7去掉前面的“今日天气实况：”部分。
		NSString* content = [[[dataElements objectAtIndex:10] stringValue]
			substringFromIndex:7];
		// 对content进行字符串分割
		NSArray* compnents = [content componentsSeparatedByString:@"；"];
		UILabel* tempLabel = (UILabel*)[cell viewWithTag:2];
		tempLabel.text = [compnents[0] substringFromIndex:3];
		// 获取显示湿度的UILabel，并设置实时气温信息
		UILabel* humidityLabel = (UILabel*)[cell viewWithTag:4];
		humidityLabel.text = compnents[2] ;
		// 获取显示风力、风向信息的UILabel，并设置方向信息
		UILabel* windLabel = (UILabel*)[cell viewWithTag:5];
		windLabel.text = [compnents[1] substringFromIndex:6];
		// 获取显示空气质量的UILabel，并设置天气概述信息
		UILabel* airLabel = (UILabel*)[cell viewWithTag:6];
		airLabel.text = compnents[3];
	}
	return cell;
}

// 当用户点击“设置”按钮或选择某个城市时触发segue时调用该方法
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	// 获取该segue导航的目标视图控制器
	id destController = segue.destinationViewController;
	// 如果目标视图控制器是FKProvincesViewController
	if ([destController isMemberOfClass: FKProvincesViewController.class])
	{
		FKProvincesViewController* provincesController =
			(FKProvincesViewController*)destController;
		// 将当前根视图控制器传给对象传给FKProvincesViewController，
		// 以便它为FKCitysViewController设置delegate
		provincesController.rootInstance = self;
	}
	else
	{
		// 获取用户点击的表格行
		UITableViewCell* clickedCell = (UITableViewCell*)sender;
		NSIndexPath* indexPath = [self.tableView indexPathForCell:clickedCell];
		FKForecastViewController* forecastController =
			(FKForecastViewController*)destController;
		// 将用户选择的城市的天气情况传给下一个视图控制器。
		forecastController.weatherString = [self.weatherData
			objectForKey:self.cityData[indexPath.row]];  // ①
	}
}
// 定义一个方法，获取属性列表文件的保存路径。
- (NSString*) filePath
{
	// 获取应用的Documents路径
	NSArray *paths = NSSearchPathForDirectoriesInDomains(
		NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [NSString stringWithFormat:@"%@/cityList.plist"
		, documentsDirectory];
}
// 实现CityViewControllerDelegate协议中的方法,使用传进来的参数改变cityData集合的值,
// 以便用户选中城市时将城市名称传给该视图控制器，从而直接显示最新的城市列表。
- (void) addCityToRootView:(NSString *)cityValue
{
	// 只有当用户选择的城市不在城市列表内时，才将用户选择的城市添加到NSMutableArray中
	if(![self.cityData containsObject:cityValue])
	{
		// 将城市名称添加到可变数组
		[self.cityData addObject:cityValue];
		// 将最新的城市列表保存到底层的属性列表文件中
		[self.cityData writeToFile:self.filePath atomically:YES];
		// UITableView 刷新数据
		[self.tableView reloadData];
	}
}
@end
