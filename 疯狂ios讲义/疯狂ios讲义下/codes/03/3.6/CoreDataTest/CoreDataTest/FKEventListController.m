//
//  FKEventListController.m
//  CoreDataTest
//
//  Created by yeeku on 13-9-1.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKEventListController.h"
#import "FKAppDelegate.h"
#import "FKEvent.h"

@interface FKEventListController ()
@property (nonatomic, weak) FKAppDelegate* appDelegate;
@end

@implementation FKEventListController
NSMutableArray* eventArray;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 获取应用程序委托对象
	self.appDelegate = (FKAppDelegate*)[UIApplication sharedApplication]
		.delegate;
}
- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	// 创建抓取数据的请求对象
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	// 设置要抓取哪种类型的实体
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"FKEvent"
		inManagedObjectContext:self.appDelegate.managedObjectContext];
	// 设置抓取实体
	[request setEntity:entity];
	NSError *error = nil;
	// 执行抓取数据的请求，返回符合条件的数据
	eventArray = [[self.appDelegate.managedObjectContext
		executeFetchRequest:request error:&error] mutableCopy];
}
// 实现该方法确定该表格包含多少个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}
// 实现该方法确定该表格包含多少行
- (NSInteger)tableView:(UITableView *)tableView
	numberOfRowsInSection:(NSInteger)section
{
	return eventArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
	cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"event";
	// 取出可重用的单元格
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
		CellIdentifier forIndexPath:indexPath];
	// 根据表格行的行号获取对应的FKEvent对象
	FKEvent* event = [eventArray objectAtIndex:indexPath.row];
	// 设置单元格的内容
	cell.textLabel.text = event.name;
	cell.detailTextLabel.text = [event.happenDate description];
	return cell;
}
// UITableViewDelegate协议中定义的方法。
// 该方法的返回值作为删除指定表格行时确定按钮的文本
- (NSString *)tableView:(UITableView *)tableView
	titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return @"确认删除";
}
// UITableViewDataSource协议中定义的方法。
// 编辑（包括删除或插入）完成时激发该方法
- (void) tableView:(UITableView *)tableView commitEditingStyle:
(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 如果正在提交删除操作
	if (editingStyle == UITableViewCellEditingStyleDelete)
	{
		NSInteger rowNo = [indexPath row];
		// 获取将要删除的实体
		FKEvent* deleteEvent = [eventArray objectAtIndex:rowNo];
		// 从托管对象上下文中删除指定对象
		[self.appDelegate.managedObjectContext deleteObject:deleteEvent];
		NSError *error;
		// 保存删除操作，如果出现错误，显示错误信息
		if (![self.appDelegate.managedObjectContext save:&error])
		{
			NSLog(@"删除FKEvent实体出错:%@,%@",error,[error userInfo]);
		}
		// 从eventArray集合中删除该元素
		[eventArray removeObject:deleteEvent];
		// 从UITable程序界面上删除指定表格行。
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
			withRowAnimation:UITableViewRowAnimationAutomatic];
	}
}
- (IBAction)toggleDelete:(id)sender
{

	// 使用动画切换表格的编辑状态
	[self.tableView setEditing: !self.tableView.editing animated:YES] ;
	// 如果当前处于编辑状态
	if (self.tableView.editing)
	{
		// 修改工具条上按钮的文本
		self.deleteBn.title = @"完成";
	}
	// 如果当前没有处于编辑状态
	else
	{
		// 修改工具条上按钮的文本
		self.deleteBn.title = @"删除";
	}
}
@end
