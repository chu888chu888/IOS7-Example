//
//  FKViewController.m
//  UITextViewTest
//
//  Created by yeeku on 13-6-6.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()
@property (nonatomic, strong) UINavigationItem* navItem;
@end

@implementation FKViewController
UIBarButtonItem* done;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 将该控制器本身设置为textView控件的委托对象
	self.textView.delegate = self;
	// 创建、并添加导航条
	UINavigationBar* navBar = [[UINavigationBar alloc] initWithFrame:
		CGRectMake(0, 20, 320, 44)];
	[self.view addSubview:navBar];
	// 创建导航项、并设置导航项的标题
	self.navItem = [[UINavigationItem alloc]
		initWithTitle:@"导航条"];
	// 将导航栏添加到导航项中
	navBar.items = [NSArray arrayWithObject:self.navItem];
	// 创建一个UIBarButtonItem对象，并赋给done属性
	done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
		target:self action:@selector(finishEdit)];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
	// 为导航条设置右边的按钮
	self.navItem.rightBarButtonItem = done;
}
- (void)textViewDidEndEditing:(UITextView *)textView {
	// 取消导航条设置右边的按钮
	self.navItem.rightBarButtonItem = nil;
}
- (void) finishEdit {
	// 让textView控件放弃作为第一响应者
	[self.textView resignFirstResponder];
}
@end
