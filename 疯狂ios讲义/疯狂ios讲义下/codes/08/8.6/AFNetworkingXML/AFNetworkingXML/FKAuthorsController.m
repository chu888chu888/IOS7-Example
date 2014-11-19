//
//  FKViewController.m
//  AFNetworkingTest
//
//  Created by yeeku on 13-9-30.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKAuthorsController.h"
#import "FKBooksController.h"
#import "FKAppDelegate.h"

@interface FKAuthorsController () <NSXMLParserDelegate>
{
	FKAppDelegate* appDelegate;
	NSMutableArray* authors;
	NSMutableDictionary* author;
	NSString* currentTagValue;
}
@end
@implementation FKAuthorsController
- (void)viewDidLoad
{
    [super viewDidLoad];
	appDelegate = [UIApplication sharedApplication].delegate;
	NSString* url = @"http://192.168.1.88:8888/AFNetworkingServer/authors.xml";
	// 使用AFHTTPRequestOperationManager发送GET请求
	[appDelegate.manager GET:url parameters:nil
		// 获取服务器响应成功时激发的代码块
		success:^(AFHTTPRequestOperation *operation, id responseObject)
		{
			// 获取服务器响应的XML数据，并使用NSXMLParser解析该XML数据
			NSXMLParser* parser = responseObject;
			// 指定解析器的delegate是该控制器本身
			parser.delegate = self;
			// 解析服务器响应的XML数据
			[parser parse];
			// 重新加载表格数据
			[self.tableView reloadData];
		}
		// 获取服务器响应失败时激发的代码块
		failure:^(AFHTTPRequestOperation *operation, NSError *error)
		{
			NSLog(@"获取作者信息出现错误: %@", error);
		}];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	UITableViewCell* cell = (UITableViewCell*)sender;
	// 获取激发跳转的单元格所在的NSIndexPath
	NSIndexPath* indexPath = [self.tableView indexPathForCell:cell];
	// 获取即将跳转到的目标视图控制器
	FKBooksController* booksController = (FKBooksController*)
		segue.destinationViewController;
	// 将用户选中的单元格的作者信息传给目标视图控制器
	booksController.selectedAuthor = [authors objectAtIndex:indexPath.row];
}
// --------下面两个方法根据authors集合的元素来显示表格数据---------
- (NSInteger)tableView:(UITableView *)tableView
 	numberOfRowsInSection:(NSInteger)section
{
	return authors.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
	cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:
		@"authorCell" forIndexPath:indexPath];
	NSDictionary* dict = [authors objectAtIndex:indexPath.row];
	cell.textLabel.text = [dict objectForKey:@"name"];
	cell.detailTextLabel.text = [dict objectForKey:@"desc"];
	return cell;
}
// 当开始处理某个元素时触发该方法
-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
	namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
	attributes:(NSDictionary *)attributeDict
{
	if([elementName isEqualToString:@"authors"])
	{
		// 如果正在处理根元素，在此处初始化存储解析结果的NSMutableArray集合
		authors = [[NSMutableArray alloc] init];
	}
	// 如果正在处理<author.../>元素
	else if([elementName isEqualToString:@"author"])
	{
		// 初始化NSMutableDictionary对象
		author = [[NSMutableDictionary alloc] init];
	}
}
// 当开始处理字符串内容时触发该方法
-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	// 如果当前的字符串值不为nil，保存当前正在处理的元素的值
	if(string)
	{
		currentTagValue = string;
	}
}
// 当处理某个元素结束时触发该方法
-(void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
	namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	// 如果处理根元素结束，表明XML文档处理完成。
	if([elementName isEqualToString:@"authors"])
	{
		return;
	}
	// 如果处理<author.../>元素结束，则将封装的NSDictionary对象添加到NSMutableArray集合中
	else if([elementName isEqualToString:@"author"])
	{
		[authors addObject:author];
		author = nil;
	}
	else
	{
		// 如果既不是处理<authors.../>元素，也不是处理<author.../>元素的时候,
		// 则使用KVC方式为当前NSDictionary对象添加key-value对
		[author setValue:currentTagValue forKey:elementName];
		currentTagValue = nil;
	}
}
@end
