//
//  FKViewController.m
//  UINavigationBarTest
//
//  Created by yeeku on 13-6-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
// 记录当前是添加第几个UINavigationItem的计数器
NSInteger count;
UINavigationBar *navigationBar;
- (void)viewDidLoad
{
	[super viewDidLoad];
	count = 1;
	// 创建一个导航栏
   	navigationBar = [[UINavigationBar alloc]
		initWithFrame:CGRectMake(0, 20, 320, 44)];
	// 把导航栏添加到视图中
	[self.view addSubview:navigationBar];
	// 调用push方法添加一个UINavigationItem
	[self push];
}

-(void)push
{
	// 把导航栏集合添加入导航栏中，设置动画打开
	[navigationBar pushNavigationItem:
	 	[self makeNavItem] animated:YES];
	count++;	
}

-(void)pop
{
	// 如果还有超过2个的UINavigationItem
	if(count > 2)
	{
		count--;
		// 弹出最顶层的UINavigationItem
		[navigationBar popNavigationItemAnimated:YES];
	}
	else
	{
		// 使用UIAlertView提示用户
		UIAlertView* alert = [[UIAlertView alloc]
			initWithTitle:@"提示"
			message:@"只剩下最后一个导航项，再出栈就没有了"
			delegate:nil cancelButtonTitle:@"OK"
			otherButtonTitles: nil];
		[alert show];
	}
}

- (UINavigationItem*) makeNavItem
{
	// 创建一个导航项
	UINavigationItem *navigationItem = [[UINavigationItem alloc]
			initWithTitle:nil];
	// 创建一个左边按钮
	UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]
		initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
		target:self
		action:@selector(push)];
	// 创建一个右边按钮
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]
		initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
		target:self
		action:@selector(pop)];
	//设置导航栏内容
	navigationItem.title = [NSString stringWithFormat:
		@"第【%d】个导航项"
		, count];
	//把左右两个按钮添加入导航栏集合中
	[navigationItem setLeftBarButtonItem:leftButton];
	[navigationItem setRightBarButtonItem:rightButton];
	return navigationItem;
}
@end
