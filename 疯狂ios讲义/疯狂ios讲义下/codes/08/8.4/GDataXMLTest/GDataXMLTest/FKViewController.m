//
//  FKViewController.m
//  NSXMLParserTest
//
//  Created by yeeku on 13-10-1.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "FKBooksParser.h"
#import "FKBook.h"

@implementation FKViewController
NSArray* books;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 获取FKBooksParser实例对象
	FKBooksParser* booksParser = [[FKBooksParser alloc] init];
	// 解析XML文档，获取解析得到的NSArray集合
	books =[booksParser parseXML:@"books"];
}
- (NSInteger)tableView:(UITableView *)tableView
 	numberOfRowsInSection:(NSInteger)section
{
	// books属性包含多少个元素，此处就显示多少个表格行。
	return books.count;
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
	FKBook* book = [books objectAtIndex:indexPath.row];
	// 为3个UILabel设置文本
	titleLabel.text = book.title;
	authorLabel.text = book.author;
	remarkLabel.text = book.remark;
	return cell;
}
@end
