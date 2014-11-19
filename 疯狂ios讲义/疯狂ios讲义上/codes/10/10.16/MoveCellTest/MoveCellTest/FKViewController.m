//
//  FKViewController.m
//  MoveCellTest
//
//  Created by yeeku on 13-6-18.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
NSMutableArray* list;
// 记录当前正在执行的操作，0代表删除，1代表插入
NSUInteger action;
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
	action = 0;
	self.table.delegate = self;
	self.table.dataSource = self;
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
// UITableViewDelegate协议中定义的方法。该方法的返回值决定单元格的编辑状态
- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView
	editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 如果action的值为0，代表将要删除
	return action == 0 ? UITableViewCellEditingStyleDelete:
		UITableViewCellEditingStyleInsert;
}
// UITableViewDelegate协议中定义的方法。
// 该方法的返回值作为删除指定表格行时确定按钮的文本
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:
	(NSIndexPath *)indexPath
{
	return @"确认删除";
}

// UITableViewDataSource协议中定义的方法。该方法的返回值决定某行是否可编辑
- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:
	(NSIndexPath *)indexPath
{
	// 如果该表格行的数据为孙悟空，返回NO——代表这行数据不能编辑
	if ([[list objectAtIndex:[indexPath row]] isEqualToString:@"孙悟空"])
	{
		return NO;
	}
	// 除了第2个表格行的数据不能编辑
	if (indexPath.row == 1) {
		return NO;
	}
	return YES;
}
// UITableViewDataSource协议中定义的方法。移动完成时激发该方法
- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:
	(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)
	destinationIndexPath
{
	NSInteger sourceRowNo = [sourceIndexPath row];
	NSInteger destRowNo = [destinationIndexPath row];
	// 获取将要移动的数据
	id targetObj = [list objectAtIndex:sourceRowNo];
	// 从底层数组中删除指定数据项
	[list removeObjectAtIndex: sourceRowNo];
	// 将移动的数据项插入到指定位置。
	[list insertObject:targetObj atIndex:destRowNo];
}

// UITableViewDataSource协议中定义的方法。
// 编辑（包括删除或插入）完成时激发该方法
- (void) tableView:(UITableView *)tableView commitEditingStyle:
	(UITableViewCellEditingStyle)editingStyle
 	forRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 如果正在提交删除操作
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		NSInteger rowNo = [indexPath row];		
		// 从底层NSArray集合中删除指定数据项
		[list removeObjectAtIndex: rowNo];
		// 从UITable程序界面上删除指定表格行。
		[tableView deleteRowsAtIndexPaths:[NSArray
			arrayWithObject:indexPath]
			withRowAnimation:UITableViewRowAnimationAutomatic];
	}
	// 如果正在提交插入操作	
	if(editingStyle == UITableViewCellEditingStyleInsert)
	{
		// 将当前行的数据插入到底层NSArray集合中
		[list insertObject:[list objectAtIndex:indexPath.row]
			atIndex:indexPath.row + 1];
		// 为UITableView控件的界面上插入一行
		[tableView insertRowsAtIndexPaths:[NSArray
			arrayWithObject:indexPath]
			withRowAnimation:UITableViewRowAnimationFade];
	}
}
- (IBAction) toggleEdit:(id)sender
{
	// 如果用户单击了“删除”按钮，action设为0（代表删除），否则action设为1（代表添加）
	if([[sender title] isEqualToString:@"删除"])
	{
		action = 0;
	}
	else
	{
		action = 1;
	}
	// 使用动画切换表格的编辑状态
	[self.table setEditing: !self.table.editing animated:YES] ;
	
	// 如果当前处于编辑状态
	if (self.table.editing)
	{
		// 修改工具条上2个按钮的文本
		self.addBn.title = @"完成";
		self.deleteBn.title = @"完成";
	}
	// 如果当前没有处于编辑状态
	else
	{
		// 修改工具条上2个按钮的文本	
		self.addBn.title = @"添加";
		self.deleteBn.title	 = @"删除";
	}
}
@end

