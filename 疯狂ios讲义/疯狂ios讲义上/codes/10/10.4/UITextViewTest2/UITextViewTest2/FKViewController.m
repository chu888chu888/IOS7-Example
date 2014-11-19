//
//  FKViewController.m
//  UITextViewTest2
//
//  Created by yeeku on 13-6-7.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建一个UIToolBar工具条
	UIToolbar * topView = [[UIToolbar alloc]
		initWithFrame:CGRectMake(0, 0, 320, 30)];
	// 设置工具条风格
	[topView setBarStyle:UIBarStyleDefault];
	// 为工具条创建第1个“按钮”
	UIBarButtonItem* myBn = [[UIBarButtonItem alloc]
		initWithTitle:@"无动作"
		style:UIBarButtonItemStyleBordered
		target:self action:nil];
	// 为工具条创建第2个“按钮”，该按钮只是一片可伸缩的空白区。
	UIBarButtonItem* spaceBn = [[UIBarButtonItem alloc]
		initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
		target:self action:nil];
	// 为工具条创建第3个“按钮”，单击该按钮会激发editFinish方法
	UIBarButtonItem* doneBn = [[UIBarButtonItem alloc]
		initWithTitle:@"完成"
		style:UIBarButtonItemStyleDone
		target:self action:@selector(editFinish)];
	// 以3个按钮创建NSArray集合
	NSArray * buttonsArray = [NSArray arrayWithObjects
		:myBn,spaceBn,doneBn,nil];
	// 为UIToolBar设置按钮
	[topView setItems:buttonsArray];
	// 为textView关联的虚拟键盘设置附件
	[self.textView setInputAccessoryView:topView];
}

- (void) didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) editFinish
{
	[self.textView resignFirstResponder];
}
@end
