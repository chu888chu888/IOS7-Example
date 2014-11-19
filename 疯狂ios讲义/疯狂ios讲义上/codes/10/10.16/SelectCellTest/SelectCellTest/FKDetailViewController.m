//
//  FKDetailViewController.m
//  SelectCellTest
//
//  Created by yeeku on 13-6-18.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKDetailViewController.h"
#import "FKViewController.h"
#import "FKAppDelegate.h"

@interface FKDetailViewController ()

@end

@implementation FKDetailViewController
// 定义应用程序委托对象
FKAppDelegate* appDelegate;
// 定义正在编辑的表格行的行号
NSUInteger rowNo;
- (void)viewDidLoad
{
	[super viewDidLoad];
}
// 当该视图将要显示出来时调用该方法
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	appDelegate = [UIApplication sharedApplication].delegate;
	// 获取正在编辑的表格行的行号
	rowNo = self.editingIndexPath.row;
	// 对nameField和detailField的text赋值
	self.nameField.text = [appDelegate.books
		objectAtIndex:rowNo];
	self.detailField.text = [appDelegate.details
		objectAtIndex:rowNo];
}
-(IBAction)clicked:(id)sender
{
	// 替换appDelegate的books集合中指定索引处的元素
	[appDelegate.books replaceObjectAtIndex:rowNo
		withObject:self.nameField.text];
	// 替换appDelegate的details集合中指定索引处的元素
	[appDelegate.details replaceObjectAtIndex:rowNo
		withObject:self.detailField.text];
	// 获取Storyboard文件中ID为list的视图控制器
	FKViewController* listController = [self.storyboard
		instantiateViewControllerWithIdentifier:@"list"];
	// 控制程序窗口显示listController控制器
	appDelegate.window.rootViewController = listController;
}
- (IBAction)finished:(id)sender
{
	// 让sender放弃作为第一个响应者
	[sender resignFirstResponder];
}
@end
