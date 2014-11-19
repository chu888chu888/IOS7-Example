//
//  FKViewController.m
//  DynaCell
//
//  Created by yeeku on 13-9-25.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController

NSArray* books;
- (void)viewDidLoad
{
	[super viewDidLoad];
	self.tableView.dataSource = self;
	books = [NSArray arrayWithObjects:@"疯狂Android讲义",
		@"疯狂iOS讲义", @"疯狂Ajax讲义" , @"疯狂XML讲义", nil];

}
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	return books.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
	cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	NSInteger rowNo = indexPath.row;  // 获取行号
	// 根据行号的奇偶性使用不同的标识符
	NSString* identifier = rowNo % 2 == 0 ? @"cell1" : @"cell2";
	// 根据identifier获取表格行（identifier要么是cell1，要么是cell2）
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
		identifier forIndexPath:indexPath];
	// 获取cell内包含的Tag为1的UILabel
	UILabel* label = (UILabel*)[cell viewWithTag:1];
	label.text = [books objectAtIndex:rowNo];
	return cell;
}

@end
