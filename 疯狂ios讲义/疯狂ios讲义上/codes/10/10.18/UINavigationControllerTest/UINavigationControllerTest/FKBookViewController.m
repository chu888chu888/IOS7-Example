//
//  FKBookViewController.m
//  UINavigationControllerTest
//
//  Created by yeeku on 13-6-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import  <QuartzCore/QuartzCore.h>
#import "FKBookViewController.h"
#import "FKEditViewController.h"

@interface FKBookViewController ()

@end

@implementation FKBookViewController
@synthesize books;
@synthesize details;

- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建、并初始化NSArray对象。
	books = [NSMutableArray arrayWithObjects:@"疯狂Android讲义",
		@"疯狂iOS讲义", @"疯狂Ajax讲义" , @"疯狂XML讲义", nil];
	// 创建、并初始化NSArray对象。
	details = [NSMutableArray arrayWithObjects:
		@"长期雄踞各网店销量排行榜榜首的图书",
		@"全面而详细的iOS开发图书",
		@"Ajax开发图书" ,
		@"系统介绍XML相关知识", nil];
	// 设置当前视图关联的导航项的标题
	self.navigationItem.title = @"图书列表";
}
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self.tableView reloadData];
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
	if(!cell)
	{
		// 创建一个UITableViewCell对象，使用UITableViewCellStyleSubtitle风格
		cell = [[UITableViewCell alloc]
			initWithStyle:UITableViewCellStyleSubtitle
			reuseIdentifier:cellId];
	}
	// 从IndexPath参数中获取当前行的行号
	NSUInteger rowNo = indexPath.row;
	// 取出books中索引为rowNo的元素作为UITableViewCell的文本标题
	cell.textLabel.text = [books objectAtIndex:rowNo];
	cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//	cell.accessoryType = UITableViewCellAccessoryCheckmark;
//	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
// UITableViewDelegate定义的方法，当表格行右边的附件按钮被单击时激发该方法
- (void)tableView:(UITableView *)tableView
	accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
	// 获取表格行号
	NSInteger rowNo = indexPath.row;
	FKEditViewController* editController = [[FKEditViewController alloc]
											init];
	// 将被单击表格行的数据传给editController控制器对象
	editController.name = [books objectAtIndex:rowNo];
	editController.detail = [details objectAtIndex:rowNo];
	editController.rowNo = rowNo;
	// 将editController压入UINavigationController管理的控制器栈中
	[self.navigationController pushViewController:editController
		animated:YES];
}
@end
