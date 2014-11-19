//
//  FKViewController.m
//  JSONTest
//
//  Created by yeeku on 13-10-3.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "SBJson.h"
#import "JSONKit.h"

@implementation FKViewController
NSArray* books;
NSArray* parseResult;
NSString* tableTitle;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 定义一个Objective-C的NSArray数据，该示例会使用3种方式将该对象转换为JSON数据
	books = [NSArray arrayWithObjects:
		[NSDictionary dictionaryWithObjectsAndKeys:@"疯狂iOS讲义" , @"title",
		 	@"李刚 编著" , @"author" , @"基于最新版本的iOS 7", @"remark" , nil],
		[NSDictionary dictionaryWithObjectsAndKeys:@"疯狂Java讲义", @"title",
		 	@"李刚 编著" , @"author" ,
		 	@"本书来自作者6年的Java培训经历,凝结了作者近6000个小时的授课经验",
		 	@"remark" , nil],
		[NSDictionary dictionaryWithObjectsAndKeys:@"轻量级Java EE企业应用实战",
		 	@"title" , @"李刚 编著", @"author",
			@"本书主要介绍以Spring+Hibernate+Struts2为基础的Java EE应用",
		 	@"remark" , nil],
		[NSDictionary dictionaryWithObjectsAndKeys:@"疯狂Android讲义", @"title",
			@"李刚 编著" , @"author",
			@"本书第一版长期雄踞各网店、书店Android图书销量排行榜前列" , @"remark", nil]
		, nil];
	self.tableView.dataSource = self;
}
- (IBAction)JSONSerializationParse:(id)sender
{
	// 获取JSON文件所在的路径
	NSString* jsonPath = [[NSBundle mainBundle] pathForResource:@"books"
		ofType:@"json"];
	// 读取jsonPath对应文件的数据
	NSData* data = [NSData dataWithContentsOfFile:jsonPath];
	// 解析JSON数据，返回Objective-C对象
	parseResult = [NSJSONSerialization JSONObjectWithData:data
		options:0 error:nil];
	tableTitle = @"使用JSONSerializationParse解析";
	// 让tableView重新加载数据
	[self.tableView reloadData];

}
- (IBAction)SBParse:(id)sender
{
	// 获取JSON文件所在的路径
	NSString* jsonPath = [[NSBundle mainBundle] pathForResource:@"books"
		ofType:@"json"];
	// 读取jsonPath对应文件的数据
	NSData* data = [NSData dataWithContentsOfFile:jsonPath];
	// 创建SBJsonParser对象
	SBJsonParser* jsonParser = [[SBJsonParser alloc] init];
	parseResult = [jsonParser objectWithData:data];
	tableTitle = @"使用SBJson解析";
	// 让tableView重新加载数据
	[self.tableView reloadData];
}

- (IBAction)JSONKitParse:(id)sender
{
	// 获取JSON文件所在的路径
	NSString* jsonPath = [[NSBundle mainBundle] pathForResource:@"books"
		ofType:@"json"];
	// 读取jsonPath对应文件的数据
	NSData* data = [NSData dataWithContentsOfFile:jsonPath];
	// 调用JSONKit为NSData扩展的objectFromJSONData方法解析JSON数据
	parseResult = [data objectFromJSONData];
	tableTitle = @"使用JSONKit解析";
	// 让tableView重新加载数据
	[self.tableView reloadData];
}

- (IBAction)JSONSerializationGenerate:(id)sender
{
	// 调用NSJSONSerialization的类方法将Objective-C对象转换为JSON数据
	NSData* data = [NSJSONSerialization dataWithJSONObject:books
		options:0 error:nil];
	// 将NSData格式的JSON数据转换为字符串
	NSString* json = [[NSString alloc] initWithData:data
		encoding:NSUTF8StringEncoding];
	NSLog(@"NSJSONSerialization转换得到的字符串为：%@" , json);
	
}
- (IBAction)SBGenerate:(id)sender
{
	// 创建SBJsonWriter对象
	SBJsonWriter* jsonWriter = [[SBJsonWriter alloc] init];
	// 调用SBJsonWriter对象的方法将Objective-C对象转换为JSON字符串
	NSLog(@"SBJson转换得到的字符串为：%@" , [jsonWriter stringWithObject:books]);
}
- (IBAction)JSONKitGenerate:(id)sender
{
	// 调用JSONKit为NSArray对象扩展的JSONString方法将Objective-C对象转换为JSON字符串
	NSLog(@"JSONKit转换得到的字符串为：%@" , [books JSONString]);
}
- (NSString *)tableView:(UITableView *)tableView
	titleForHeaderInSection:(NSInteger)section
{
	return tableTitle;
}
- (NSInteger)tableView:(UITableView *)tableView
	numberOfRowsInSection:(NSInteger)section
{
	// parseResult中包含多少个对象，该表格显示多少行
	return [parseResult count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView
	cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 根据动态单元格原型的ID来获取可重用单元格
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:
		@"bookCell" forIndexPath:indexPath];
	// 获取当前行号在parseResult中对应的数据
	NSDictionary* book = [parseResult objectAtIndex:indexPath.row];
	// 获取单元格中3个控件，并为3个控件设置显示文本
	UILabel* titleLable = (UILabel*)[cell viewWithTag:1];
	titleLable.text = [book objectForKey:@"title"];
	UILabel* authorLable = (UILabel*)[cell viewWithTag:2];
	authorLable.text = [book objectForKey:@"author"];
	UILabel* remarkLabel = (UILabel*)[cell viewWithTag:3];
	remarkLabel.text = [book objectForKey:@"remark"];
	return cell;
}
@end
