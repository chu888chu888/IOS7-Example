//
//  FKViewController.m
//  NSXMLParserTest
//
//  Created by yeeku on 13-10-1.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "FKXMLPraserDelegate.h"
#import "FKBook.h"

@implementation FKViewController
FKXMLPraserDelegate* parserDeletage;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 获取要解析的XML文档的所在的URL（使用URL即可解析本地XML文档，也可解析网络XML文档）
	NSURL* fileUrl = [[NSBundle mainBundle]
		URLForResource:@"books" withExtension:@"xml"];
	// 获取NSXMLParser实例对象
	NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:fileUrl];
	// 创建NSXMLParser解析的委托对象。
	parserDeletage = [[FKXMLPraserDelegate alloc] init];
	// 为NSXMLParser指定委托对象，该委托对象就负责处理解析事件
	parser.delegate = parserDeletage;
	// 开始解析, 解析结果会保存在委托对象的books属性中
	[parser parse];
}
- (NSInteger)tableView:(UITableView *)tableView
 	numberOfRowsInSection:(NSInteger)section
{
	// parserDeletage的books属性包含多少个元素，此处就显示多少个表格行。
	return parserDeletage.books.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
	cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 获取可重用的单元格
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:
		@"bookCell" forIndexPath:indexPath];
	// 从可重用单元格中根据Tag分别取出3个UILabel控件
	UILabel* titleLabel = (UILabel*)[cell viewWithTag:1];
	UILabel* authorLabel = (UILabel*)[cell viewWithTag:2];
	UILabel* remarkLabel = (UILabel*)[cell viewWithTag:3];
	FKBook* book = [parserDeletage.books objectAtIndex:indexPath.row];
	// 为3个UILabel设置文本
	titleLabel.text = book.title;
	authorLabel.text = book.author;
	remarkLabel.text = book.remark;
	return cell;
}
@end
