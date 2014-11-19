//
//  FKBookListController.m
//  UITabBarControllerTest
//
//  Created by yeeku on 13-6-29.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKBookListController.h"

@interface FKBookListController ()

@end

@implementation FKBookListController
NSArray* books;
- (id)initWithStyle:(UITableViewStyle)style
{
	if ([super initWithStyle:style] != nil) {
		UITabBarItem* item = [[UITabBarItem alloc]
			initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:1];
		// 为标签项设置徽标
		item.badgeValue = @"热";
		// 为该控制器设置标签项
		self.tabBarItem = item;
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	books = [NSArray arrayWithObjects:@"疯狂iOS讲义",
		@"疯狂Android讲义",
		@"疯狂XML讲义" ,
		@"疯狂Ajax讲义" , nil];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView
 	numberOfRowsInSection:(NSInteger)section
{
	return [books count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellId = @"Cell";
    UITableViewCell *cell = [tableView
		dequeueReusableCellWithIdentifier:CellId];
    if(cell == nil)
	{
		cell = [[UITableViewCell alloc]
			initWithStyle:UITableViewCellStyleDefault
			reuseIdentifier:CellId];
	}
	cell.textLabel.text = [books objectAtIndex:indexPath.row];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
@end
