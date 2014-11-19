//
//  FKMasterViewController.m
//  Books
//
//  Created by yeeku on 13-2-9.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKMasterViewController.h"
#import "FKAppDelegate.h"

@implementation FKMasterViewController

FKAppDelegate* appDelegate;
- (void)awakeFromNib
{
	[super awakeFromNib];
	// 是否自动清除选择
	self.clearsSelectionOnViewWillAppear = NO;
	// 设置该浮动窗口内容的大小
	self.preferredContentSize = CGSizeMake(320.0, 600.0);
}
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 获取应用程序委托。
	appDelegate = [UIApplication sharedApplication].delegate;	
	// 创建“编辑”导航按钮
	UIBarButtonItem *editButton = [[UIBarButtonItem alloc]
		initWithTitle:@"编辑" style:UIBarButtonItemStyleBordered
		target:self action:@selector(toggleEdit)];
	// 为导航条的左边添加一个“编辑”导航按钮
	self.navigationItem.leftBarButtonItem = editButton;
	// 创建“添加”导航按钮
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
		initWithTitle:@"添加" style:UIBarButtonItemStyleBordered
		target:self action:@selector(insertNewObject:)];
	// 为导航条的左边添加一个“添加”导航按钮
	self.navigationItem.rightBarButtonItem = addButton;
	// 让该tableView初始选中第一个section的第一行。
	[self.tableView selectRowAtIndexPath:[NSIndexPath
		indexPathForItem:0 inSection:0] animated:YES
		scrollPosition:UITableViewScrollPositionMiddle];
}
// 该事件处理方法，用于添加一本新图书
- (void)insertNewObject:(id)sender
{
	// 向appDelegate的books集合中添加一个对象
	[appDelegate.books insertObject:@"新图书" atIndex:0];
	// 以第一个分区、第一行创建NSIndexPath
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
	// 插入一行
	[self.tableView insertRowsAtIndexPaths:@[indexPath]
		withRowAnimation:UITableViewRowAnimationAutomatic];
}
// 该事件处理方法，用于切换该表格编辑状态
- (void) toggleEdit
{
	// 切换编辑
	[self.tableView setEditing:
	 	!self.tableView.editing animated:YES];
	if(self.tableView.editing)
	{
		[self.navigationItem.leftBarButtonItem setTitle:@"完成"];
	}
	else
	{
		[self.navigationItem.leftBarButtonItem setTitle:@"编辑"];
	}
}
// UITableViewDataSource的方法，该方法返回值控制指定分区包含多少个表格行。
- (NSInteger)tableView:(UITableView *)tableView
	numberOfRowsInSection:(NSInteger)section
{
	return appDelegate.books.count;
}
// UITableViewDataSource的方法，该方法返回值作为指定NSIndexPath对应的表格行
- (UITableViewCell *)tableView:(UITableView *)tableView
	cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString* cellId = @"bookCell";
	UITableViewCell *cell = [tableView
		dequeueReusableCellWithIdentifier:cellId];
	if(!cell)
	{
		cell = [[UITableViewCell alloc]
			initWithStyle:UITableViewCellStyleDefault
			reuseIdentifier:cellId];
	}
	cell.textLabel.text = appDelegate.books[indexPath.row];
	cell.showsReorderControl = YES;
	return cell;
}
// UITableViewDataSource的方法，该方法返回值决定NSIndexPath对应的表格行是否可编辑
- (BOOL)tableView:(UITableView *)tableView
	canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}
// UITableViewDataSource的方法，删除、添加完成都回调该方法
- (void)tableView:(UITableView *)tableView commitEditingStyle:
	(UITableViewCellEditingStyle)editingStyle
	forRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 如果执行的是删除操作
	if (editingStyle == UITableViewCellEditingStyleDelete)
	{
		// 从appDelegate的books集合中删除指定元素
		[appDelegate.books removeObjectAtIndex:indexPath.row];
		// 从tableView上删除指定行
		[tableView deleteRowsAtIndexPaths:@[indexPath]
			withRowAnimation:UITableViewRowAnimationFade];
	}
	// 如果执行的是插入（实际上我们不允许插入），此处不进行处理
	else if (editingStyle == UITableViewCellEditingStyleInsert)
	{
	}
}
// UITableViewDataSource的方法，该方法的返回值控制指定表格行是否可移动
- (BOOL)tableView:(UITableView *)tableView
	canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}
// UITableViewDataSource的方法，移动表格行后激发的方法
- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:
	(NSIndexPath *)sourceIndexPath toIndexPath:
	(NSIndexPath *)destinationIndexPath
{
	NSInteger sourceRowNo = [sourceIndexPath row];
	NSInteger destRowNo = [destinationIndexPath row];
	// 获取将要移动的数据
	id targetObj = [appDelegate.books objectAtIndex:sourceRowNo];
	// 从底层数组中删除指定数据项
	[appDelegate.books removeObjectAtIndex: sourceRowNo];
	// 将移动的数据项插入到指定位置。
	[appDelegate.books insertObject:targetObj atIndex:destRowNo];
}
// UITableViewDelegate的方法，该方法返回值控制指定单元格的编辑风格
- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView
	editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellEditingStyleDelete;
}
// UITableViewDelegate的方法，当用户选中某个表格行时激发该方法
- (void)tableView:(UITableView *)tableView
	didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *book = appDelegate.books[indexPath.row];
	// 修改detailViewController的detailItem属性
	self.detailViewController.detailItem = book;
}
@end
