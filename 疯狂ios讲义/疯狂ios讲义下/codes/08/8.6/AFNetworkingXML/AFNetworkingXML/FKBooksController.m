//
//  FKBooksController.m
//  AFNetworkingTest
//
//  Created by yeeku on 13-10-3.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKBooksController.h"
#import "FKAppDelegate.h"

@interface FKBooksController () <NSXMLParserDelegate>
{
	FKAppDelegate* appDelegate;
	NSMutableArray* books;
	NSMutableDictionary* book;
	NSString* currentElementValue;
}
@end
@implementation FKBooksController
- (void)viewDidLoad
{
    [super viewDidLoad];
	appDelegate = [UIApplication sharedApplication].delegate;
	NSString* url = @"http://192.168.1.88:8888/AFNetworkingServer/books.xml";
	self.navigationItem.title = [NSString stringWithFormat:@"%@的图书"
		, [self.selectedAuthor objectForKey:@"name"]];
	NSDictionary *parameters = @{@"authorId":
		[self.selectedAuthor objectForKey:@"id"]};
	// 使用AFHTTPRequestOperationManager发送GET请求
	[appDelegate.manager POST:url parameters:parameters
		// 获取服务器响应成功时激发的代码块
		success:^(AFHTTPRequestOperation *operation, id responseObject)
		{
			// 获取服务器响应的XML数据，并使用NSXMLParser解析该XML数据
			NSXMLParser* parser = responseObject;
			// 指定解析器的delegate是该控制器本身
			parser.delegate = self;
			// 解析服务器响应的XML数据
			[parser parse];
			// 重写加载表格数据
			[self.tableView reloadData];
		}
		// 获取服务器响应失败时激发的代码块
		failure:^(AFHTTPRequestOperation *operation, NSError *error)
		{
			NSLog(@"获取图书信息出现错误: %@", error);
		}];
}
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	return books.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 根据动态单元格原型的ID来获取可重用单元格
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:
							 @"bookCell" forIndexPath:indexPath];
	// 获取当前行号在books中对应的数据
	NSDictionary* dict = [books objectAtIndex:indexPath.row];
	// 获取单元格中3个控件，并为3个控件设置显示文本
	UILabel* titleLable = (UILabel*)[cell viewWithTag:1];
	titleLable.text = [dict objectForKey:@"title"];
	UILabel* authorLable = (UILabel*)[cell viewWithTag:2];
	authorLable.text = [dict objectForKey:@"author"];
	UILabel* remarkLabel = (UILabel*)[cell viewWithTag:3];
	remarkLabel.text = [dict objectForKey:@"remark"];
	return cell;
}
// 当开始处理某个元素时触发该方法
-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
	namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
	attributes:(NSDictionary *)attributeDict
{
	if([elementName isEqualToString:@"books"])
	{
		// 如果正在处理根元素，在此处初始化存储解析结果的NSMutableArray集合
		books = [[NSMutableArray alloc] init];
	}
	// 如果正在处理<book.../>元素
	else if([elementName isEqualToString:@"book"])
	{
		// 初始化NSMutableDictionary对象
		book = [[NSMutableDictionary alloc] init];
	}
}
// 当开始处理字符串内容时触发该方法
-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	// 如果当前的字符串值不为nil，保存当前正在处理的元素的值
	if(string)
	{
		currentElementValue = string;
	}
}
// 当处理某个元素结束时触发该方法
-(void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	// 如果处理根元素结束，表明XML文档处理完成。
	if([elementName isEqualToString:@"books"])
	{
		return;
	}
	// 如果处理<book.../>元素结束，则将封装的NSDictionary对象添加到NSMutableArray集合中
	else if([elementName isEqualToString:@"book"])
	{
		[books addObject:book];
		book = nil;
	}
	else
	{
		// 如果既不是处理<books.../>元素，也不是处理<book.../>元素的时候,
		// 则使用KVC方式为当前NSDictionary对象添加key-value对
		[book setValue:currentElementValue forKey:elementName];
		currentElementValue = nil;
	}
}
@end