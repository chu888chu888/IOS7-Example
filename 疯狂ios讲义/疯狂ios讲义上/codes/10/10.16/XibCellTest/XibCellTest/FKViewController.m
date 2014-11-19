//
//  FKViewController.m
//  XibCellTest
//
//  Created by yeeku on 13-6-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FKViewController.h"
#import "FKBookTableCell.h"
@interface FKViewController ()

@end

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
- (UITableViewCell *)tableView:(UITableView *)tableView
	cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 为表格行定义一个静态字符串作为标示符
	static NSString* cellId = @"cellId";
	// 定义一个静态变量做旗标，用于保证仅为该表格注册一次单元格视图
	static BOOL isRegist = NO;
	if(!isRegist)
	{
		// 加载*.xib界面设计文件
		UINib* nib = [UINib nibWithNibName:@"FKBookTableCell" bundle:nil];
		// 注册单元格
		[tableView registerNib:nib forCellReuseIdentifier:cellId];
		// 注册后将该旗标设为YES
		isRegist = YES;
	}
	FKBookTableCell* cell = [tableView
		dequeueReusableCellWithIdentifier:cellId];
	// 从IndexPath参数中获取当前行的行号
	NSUInteger rowNo = indexPath.row;
	//将单元格的边框设置为圆角
	cell.layer.cornerRadius = 12;
	cell.layer.masksToBounds = YES;
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
- (void)tableView: (UITableView*)tableView willDisplayCell:
	(UITableViewCell*)cell forRowAtIndexPath: (NSIndexPath*)indexPath
{
	// 定义淡绿色和淡红色
	UIColor* greenColor = [UIColor colorWithRed:0.7
		green:1.0 blue:0.7 alpha:1.0];
	UIColor* redColor = [UIColor colorWithRed:1.0
		green:0.7 blue:0.7 alpha:1.0];
	// 根据行数的奇偶来设置不同的背景色
	cell.backgroundColor = indexPath.row % 2 ? greenColor : redColor;
	
	// 设置nameField、priceField的背景色（不使用颜色）
    ((FKBookTableCell*)cell).nameField.backgroundColor = [UIColor clearColor];
    ((FKBookTableCell*)cell).priceField.backgroundColor = [UIColor clearColor];
}
@end;
