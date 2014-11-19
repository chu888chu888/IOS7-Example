//
//  FKViewController.m
//  ExtendCellTest
//
//  Created by yeeku on 13-6-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "FKBookTableCell.h"


@implementation FKViewController
NSArray *books;
NSArray *prices;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 创建、并初始化NSArray对象。
	books = [NSArray arrayWithObjects:@"疯狂Android讲义",
		@"疯狂iOS讲义", @"疯狂Ajax讲义" , @"疯狂XML讲义", nil];
	// 创建、并初始化NSArray对象。
	prices = [NSArray arrayWithObjects:
		@"99", @"79" , @"79" , @"69" , nil];
	// 为UITableView控件设置dataSource和delegate
	self.table.dataSource = self;
	self.table.delegate = self;
}

// 该方法返回值决定各表格行的控件。
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 为表格行定义一个静态字符串作为标识符
	static NSString* cellId = @"cellId";
	// 从可重用表格行的队列中取出一个表格行
	FKBookTableCell* cell = [tableView
		dequeueReusableCellWithIdentifier:cellId];
	// 如果取出的表格行为nil
	if(cell == nil)
	{
		// 创建自定义的FKBookTableCell对象
		cell = [[FKBookTableCell alloc]
			initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
	}
	// 从IndexPath参数中获取当前行的行号
	NSUInteger rowNo = indexPath.row;
	//将单元格的边框设置为圆角
	cell.layer.cornerRadius = 12;
	cell.layer.masksToBounds = YES;
	// 为表格行的nameField、priceField的text设置值
	cell.nameField.text = [books objectAtIndex:rowNo];
	cell.priceField.text = [prices objectAtIndex:rowNo];
	return cell;
}
// 该方法的返回值决定指定分区内包含多少个表格行。
- (NSInteger)tableView:(UITableView*)tableView
	numberOfRowsInSection:(NSInteger)section
{
	// 由于该表格只有一个分区，直接返回books中集合元素个数代表表格的行数
	return books.count;
}
// 该方法的返回值将作为表格行的高度。
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:
	(NSIndexPath *)indexPath
{
	return 60;
}
@end

