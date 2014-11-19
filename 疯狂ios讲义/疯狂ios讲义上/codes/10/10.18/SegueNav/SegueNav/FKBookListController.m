//
//  FKBookListController.m
//  SegueNav
//
//  Created by yeeku on 13-7-25.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKBookListController.h"

@interface FKBookListController ()

@end

@implementation FKBookListController
NSArray* books;
- (void)viewDidLoad
{
	[super viewDidLoad];
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
	// 获取行号
	NSInteger rowNo = indexPath.row;
	// 根据identifier获取表格行
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
		@"bookCell" forIndexPath:indexPath];
	// 获取cell内包含的Tag为1的UILabel
	cell.textLabel.text = [books objectAtIndex:rowNo];
	return cell;
}
@end
