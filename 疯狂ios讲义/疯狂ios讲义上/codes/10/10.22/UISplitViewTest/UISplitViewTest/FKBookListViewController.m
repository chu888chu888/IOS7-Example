//
//  FKBookListViewController.m
//  Books
//
//  Created by yeeku on 13-2-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKBookListViewController.h"
#import "FKAppDelegate.h"

@implementation FKBookListViewController

FKAppDelegate* appDelegate;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 获取应用程序委托。
	appDelegate = [UIApplication sharedApplication].delegate;
	// 当该窗口出现时清除选择状态
	self.clearsSelectionOnViewWillAppear = NO;
	// 设置该控制器作为浮动窗口显示时的大小
	self.preferredContentSize = CGSizeMake(320
		, appDelegate.books.count * 45);
}

- (NSInteger)tableView:(UITableView *)tableView
 	numberOfRowsInSection:(NSInteger)section
{
	return appDelegate.books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
	cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView
		dequeueReusableCellWithIdentifier:CellIdentifier];
	if(!cell)
	{
		cell = [[UITableViewCell alloc]
			initWithStyle:UITableViewCellStyleDefault
			reuseIdentifier:CellIdentifier];
	}
	cell.textLabel.text = [appDelegate.books
		objectAtIndex:[indexPath row]];
	return cell;
}
- (void)tableView:(UITableView *)tableView
	didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 控制detailViewController控制器显示用户选中的图书
	self.detailViewController.detailItem =[appDelegate.books
		objectAtIndex: [indexPath row]];
}
@end
