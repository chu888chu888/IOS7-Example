//
//  FKEditVewController.m
//  UINavigationControllerTest
//
//  Created by yeeku on 13-6-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FKBookViewController.h"
#import "FKEditViewController.h"
#import "FKAppDelegate.h"

@interface FKEditViewController ()

@end

@implementation FKEditViewController

- (void)viewWillAppear:(BOOL)animated
{
	self.nameField.text = self.name;
	self.detailField.text = self.detail;
	// 设置默认不允许编辑
	self.nameField.enabled = NO;
	self.detailField.editable = NO;
	// 设置边框
	self.detailField.layer.borderWidth = 1.5;
	self.detailField.layer.borderColor = [[UIColor grayColor] CGColor];
	// 设置圆角
	self.detailField.layer.cornerRadius = 4.0f;
	self.detailField.layer.masksToBounds = YES;
	// 创建一个UIBarButtonItem对象，作为界面的导航项右边的按钮
	UIBarButtonItem* rightBn = [[UIBarButtonItem alloc]
		initWithTitle:@"编辑"
		style:UIBarButtonItemStyleBordered
		target:self action:@selector(beginEdit:)];
	self.navigationItem.rightBarButtonItem = rightBn;
}

- (void) beginEdit:(id)	sender
{
	// 如果该按钮的文本为“编辑”
	if([[sender title] isEqualToString:@"编辑"])
	{
		// 设置nameField、detailField允许编辑
		self.nameField.enabled = YES;
		self.detailField.editable = YES;
		// 设置按钮文本为“完成”
		self.navigationItem.rightBarButtonItem.title = @"完成";
	}
	else
	{
		// 放弃作为第一响应者
		[self.nameField resignFirstResponder];
		[self.detailField resignFirstResponder];
		// 获取应用程序委托对象
		FKAppDelegate* appDelegate = [UIApplication
			sharedApplication].delegate;
		// 使用用户在第一个文本框中输入的内容替换viewController
		// 的books集合中指定位置的元素
		[appDelegate.viewController.books replaceObjectAtIndex:
		 	self.rowNo withObject:self.nameField.text];
		// 使用用户在第一个文本框中输入的内容替换viewController
		// 的details集合中指定位置的元素
		[appDelegate.viewController.details replaceObjectAtIndex:
		 	self.rowNo withObject:self.detailField.text];
		// 设置nameField、detailField不允许编辑
		self.nameField.enabled = NO;
		self.detailField.editable = NO;
		// 设置按钮文本为“编辑”
		self.navigationItem.rightBarButtonItem.title = @"编辑";
	}
}
- (IBAction)finish:(id)sender {
	// 放弃作为第一响应者
	[sender resignFirstResponder];
}
@end
