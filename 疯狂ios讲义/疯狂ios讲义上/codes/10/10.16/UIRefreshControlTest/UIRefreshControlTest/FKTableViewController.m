//
//  FKTableViewController.m
//  UIRefreshControlTest
//
//  Created by yeeku on 13-6-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKTableViewController.h"

@interface FKTableViewController ()

@end

@implementation FKTableViewController
NSMutableArray* list;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 初始化NSMutableArray集合
	list = [[NSMutableArray alloc] initWithObjects:@"孙悟空",
			@"猪八戒",
			@"牛魔王",
			@"蜘蛛精",
			@"白骨精",
			@"狐狸精" , nil];
	// 设置refreshControl属性，该属性值应该是UIRefreshControl控件
	self.refreshControl = [[UIRefreshControl alloc]init];
	// 设置UIRefreshControl控件的颜色
	self.refreshControl.tintColor = [UIColor grayColor];
	// 设置该控件的提示标题
	self.refreshControl.attributedTitle = [[NSAttributedString alloc]
		initWithString:@"下拉刷新"];
	// 为UIRefreshControl控件的刷新事件设置事件处理方法
	[self.refreshControl addTarget:self action:@selector(refreshData)
		forControlEvents:UIControlEventValueChanged];
}
// 该方法返回该表格的各部分包含多少行。
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section
{
	return [list count];
}
// 该方法的返回值将作为指定表格行的UI控件
- (UITableViewCell*) tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *myId = @"moveCell";
	// 获取可重用的单元格
	UITableViewCell *cell = [tableView
		dequeueReusableCellWithIdentifier:myId];
	// 如果单元格为nil
	if(cell == nil)
	{
		// 创建UITableViewCell对象
		cell = [[UITableViewCell alloc] initWithStyle:
				UITableViewCellStyleDefault reuseIdentifier:myId];
	}
	NSInteger rowNo = [indexPath row];
	// 设置textLabel显示的文本
	cell.textLabel.text = [list objectAtIndex:rowNo];
	return cell;
}
// 刷新数据的方法
- (void) refreshData
{
	// 使用延迟2秒来模拟远程获取数据
	[self performSelector:@selector(handleData) withObject:nil afterDelay:2];
}
- (void) handleData
{
	// 获取一个随机数字符串
	NSString* randStr = [NSString stringWithFormat:@"%d"
		, arc4random() % 10000];
	// 将随机数字符串添加list集合中
	[list addObject:randStr];
	self.refreshControl.attributedTitle = [[NSAttributedString alloc]
		initWithString:@"正在刷新..."];
	// 停止刷新
	[self.refreshControl endRefreshing];
	// 控制表格重新加载数据
	[self.tableView reloadData];
}
@end
