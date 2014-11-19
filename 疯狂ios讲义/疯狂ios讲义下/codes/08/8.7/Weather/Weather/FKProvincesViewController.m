//
//  FKProvincesViewController.m
//  Weather
//
//  Created by yeeku on 13-10-6.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKProvincesViewController.h"
#import "FKASIHTTPRequestUtil.h"
#import "GDataXMLNode.h"
#import "FKCitiesViewController.h"

#define getSupportProvince @"http://www.webxml.com.cn/WebServices/WeatherWebService.asmx/getSupportProvince"
#define getSupportCity @"http://www.webxml.com.cn/WebServices/WeatherWebService.asmx/getSupportCity"
#define byProvinceName @"byProvinceName"

@implementation FKProvincesViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
	self.title = @"选择省份";
	// 通过webService获取省份信息
	FKASIHTTPRequestUtil *fkASIUtil = [[FKASIHTTPRequestUtil alloc] init];
	NSString *responseString = [fkASIUtil synchronousRequest:getSupportProvince];
	if(responseString != nil)
	{
		// 初始化NSMutableArray,用于存储省份信息
		NSMutableArray *datas = [[NSMutableArray alloc]initWithCapacity:10];
		// 根据NSString对象创建GDataXMLDocument对象
		GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithXMLString:responseString options:1 error:nil];
		// 获取根节点对象
		GDataXMLElement *rootElement = [doc rootElement];
		// 获取所有<string.../>子元素，返回NSArray集合
		NSArray *provinceElements = [rootElement elementsForName:@"string"];
		// 循环遍历每一个<string.../>子元素
		for(GDataXMLElement *provinceElement in provinceElements)
		{
			// 将每个省份添加到数组
			[datas addObject:[provinceElement stringValue]];
		}
		self.provinces = datas;
	}
}
- (NSInteger)tableView:(UITableView *)tableView
	numberOfRowsInSection:(NSInteger)section
{
	return self.provinces.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
	cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 定义动态单元格原型的Identifier
	static NSString *cellId = @"provinceCell";
	// 获取可重用的单元格	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
	// 根据行号来获取省份
	NSString *rowString = [self.provinces objectAtIndex:indexPath.row];
	// 为每个单元格设置省份
	cell.textLabel.text = rowString;
	return cell;
}
// 当用户单击某个省份触发segue时激发该方法。
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	// 获取激发segue的单元格
	UITableViewCell* clickedCell = (UITableViewCell*)sender;
	NSIndexPath* indexPath = [self.tableView indexPathForCell:clickedCell];
	// 根据激发segue的行获得数组中对应的省份
	NSString *province = [self.provinces objectAtIndex:indexPath.row];
	// 通过webService获取相关省份的城市信息
	FKASIHTTPRequestUtil *fkASIUtil = [[FKASIHTTPRequestUtil alloc] init];
	// 发送webService请求,以选中的省份为参数,返回xml字符串数组
	NSString *responseString =[fkASIUtil synchronousRequest:getSupportCity
		paramName:byProvinceName paramValue:province];
	if(responseString != nil)
	{
		NSMutableArray *datas = [[NSMutableArray alloc]init];
		// 根据NSString对象初始化GDataXMLDocument对象
		GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithXMLString:responseString options:1 error:nil];
		// 获取根节点对象
		GDataXMLElement *rootElement = [doc rootElement];
		// 获取<string.../>子元素，返回NSArray对象
		NSArray *cityElements = [rootElement elementsForName:@"string"];
		// 循环遍历每一个<string.../>元素，每个元素的内容为：广州(编号)的形式，
		// 因此我们要去掉后面的括号部分
		for(GDataXMLElement *cityElement in cityElements)
		{
			// 获取"("出现的范围
			NSRange range = [[cityElement stringValue] rangeOfString:@"("];
			// 获取"("前面的内容，也就是只获取城市的名称
			NSString *city = [[cityElement stringValue]
				substringToIndex:range.location];
			[datas addObject:city];
		}
		// 获取显示城市列表的视图控制器
		FKCitiesViewController* citysViewController = (FKCitiesViewController*)
			segue.destinationViewController;
		// 为FKCitysViewController设置delegate
		// 用于当用户选中城市时传递城市名称显示天气预报首页的视图控制器
		citysViewController.delegate = self.rootInstance;
		// 将通过webService拿到的城市数组传给城市列表视图显示
		citysViewController.citys = datas;  // ①
	}
}
@end
