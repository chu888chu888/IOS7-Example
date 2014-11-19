//
//  FKViewController.m
//  UITableViewTest
//
//  Created by yeeku on 13-6-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface FKViewController ()

@end

@implementation FKViewController

@synthesize books;
@synthesize details;

- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建、并初始化NSArray对象。
	books = [NSArray arrayWithObjects:@"疯狂Android讲义",
		@"疯狂iOS讲义", @"疯狂Ajax讲义" , @"疯狂XML讲义", nil];
	// 创建、并初始化NSArray对象。
	details = [NSArray arrayWithObjects:
		@"长期雄踞各网店销量排行榜榜首的图书",
		@"全面而详细的iOS开发图书",
		@"Ajax开发图书" ,
		@"系统介绍XML相关知识", nil];
	// 为UITableView控件设置dataSource
	self.table.dataSource = self;
	// 为UITableView控件设置页眉控件
	self.table.tableHeaderView = [[UIImageView alloc] initWithImage:
		[UIImage imageNamed:@"tableheader.png"]];
	// 为UITableView控件设置页脚控件	
	self.table.tableFooterView = [[UIImageView alloc] initWithImage:
		[UIImage imageNamed:@"tableheader.png"]];
		
}
// 该方法返回值决定各表格行的控件。
- (UITableViewCell *)tableView:(UITableView *)tableView
	cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 为表格行定义一个静态字符串作为标示符
	static NSString* cellId = @"cellId";  // ①
	// 从可重用表格行的队列中取出一个表格行
	UITableViewCell* cell = [tableView
		dequeueReusableCellWithIdentifier:cellId];
	// 如果取出的表格行为nil
	if(cell == nil)
	{
		switch(indexPath.row % 4)
		{
			case 0:
				// 创建一个UITableViewCell对象，使用UITableViewCellStyleSubtitle风格
				cell = [[UITableViewCell alloc]
					initWithStyle:UITableViewCellStyleSubtitle
					reuseIdentifier:cellId];
				break;
			case 1:
				// 创建一个UITableViewCell对象，使用默认风格
				cell = [[UITableViewCell alloc]
					initWithStyle:UITableViewCellStyleDefault
					reuseIdentifier:cellId];
				break;
			case 2:
				// 创建一个UITableViewCell对象，使用UITableViewCellStyleValue1风格
				cell = [[UITableViewCell alloc]
					initWithStyle:UITableViewCellStyleValue1
					reuseIdentifier:cellId];
				break;
			case 3:
				// 创建一个UITableViewCell对象，使用UITableViewCellStyleValue2风格
				cell = [[UITableViewCell alloc]
					initWithStyle:UITableViewCellStyleValue2
					reuseIdentifier:cellId];
				break;
		}
	}
	// 从IndexPath参数中获取当前行的行号
	NSUInteger rowNo = indexPath.row;
	// 取出books中索引为rowNo的元素作为UITableViewCell的文本标题
	cell.textLabel.text = [books objectAtIndex:rowNo];
	// 将单元格的边框设置为圆角
	cell.layer.cornerRadius = 12;
	cell.layer.masksToBounds = YES;
	// 为UITableViewCell的左端设置图片
	cell.imageView.image = [UIImage imageNamed:@"ic_gray.png"];
	// 为UITableViewCell的左端设置高亮状态视时的图片
	cell.imageView.highlightedImage = [UIImage imageNamed:
		@"ic_highlight.png"];
	// 取出details中索引为rowNo的元素作为UITableViewCell的详细内容
	cell.detailTextLabel.text = [details objectAtIndex:rowNo];
	return cell;
}
// 该方法的返回值决定指定分区内包含多少个表格行。
- (NSInteger)tableView:(UITableView*)tableView
	numberOfRowsInSection:(NSInteger)section
{
	// 由于该表格只有一个分区，直接返回books中集合元素个数代表表格的行数
	return books.count;
}
@end
