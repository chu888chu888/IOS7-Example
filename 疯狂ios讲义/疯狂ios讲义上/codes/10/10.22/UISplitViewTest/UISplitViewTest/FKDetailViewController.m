//
//  FKDetailViewController.m
//  Books
//
//  Created by yeeku on 13-2-9.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKDetailViewController.h"
#import "FKBookListViewController.h"
#import "FKAppDelegate.h"

@implementation FKDetailViewController
FKAppDelegate* appDelegate;
// 用于记录UISplitViewController自动显示的UIPopoverController
UIPopoverController *masterPopoverController;
// 导航条右边的导航按钮，用于打开浮动窗口
UIBarButtonItem* bookButton;
// 自定义的浮动窗口
UIPopoverController *bookPopoverController;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 获取应用程序委托
	appDelegate = [UIApplication sharedApplication].delegate;
	[self configureView];	
	// 创建UIBarButtonItem控件，作为导航条右边的导航按钮
	bookButton = [[UIBarButtonItem alloc] initWithTitle:@"选择图书"
		style:UIBarButtonItemStyleBordered
		target:self action:@selector(touchBookButton)];
	// 设置右边的导航按钮
	self.navigationItem.rightBarButtonItem = bookButton;
}
// 重新实现系统合成的setDetailItem方法
- (void)setDetailItem:(id)newDetailItem
{
	// 如果新Item被更新了
	if (_detailItem != newDetailItem) {
		_detailItem = newDetailItem;
		// 更新视图
		[self configureView];
	}
	// 释放masterPopoverController组件
	if (masterPopoverController != nil)
	{
		[masterPopoverController dismissPopoverAnimated:YES];
	}
}
// 使用detailView来更新界面
- (void)configureView
{
	if (self.detailItem)
	{
		// 使用bookName显示detailItem的内容。
		self.bookName.text = self.detailItem;
		// 使用bookCover显示detailItem对应的图片
		self.bookCover.image = [UIImage imageNamed:
			[appDelegate.bookCovers
			objectForKey:self.detailItem]];
	}
}
// 当用户点击右边导航按钮时激发该方法
-(void) touchBookButton
{
	if (bookPopoverController == nil) {
		FKBookListViewController *bookListController =
			[[FKBookListViewController alloc] init];
		bookListController.detailViewController = self;
		// 创建自定义的UIPopoverController
		bookPopoverController = [[UIPopoverController alloc]
			initWithContentViewController: bookListController];
		// 指定从bookButton导航按钮上弹出该浮动窗口
		[bookPopoverController presentPopoverFromBarButtonItem:bookButton
			permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
	}
	else
	{
		// 释放bookPopoverController浮动窗口
		[bookPopoverController dismissPopoverAnimated:YES];
		bookPopoverController = nil;
	}
}

// 当分割视图不再固定显示左边导航栏时激发该方法
// willHideViewController参数代表了代表了将要隐藏的导航栏控制器
// withBarButtonItem:参数代表一个导航按钮，单击该按钮即可显示浮动浮动窗口
// forPopoverController:参数代表了包含导航栏的浮动窗口
- (void)splitViewController:(UISplitViewController *)splitController
	willHideViewController:(UIViewController *)viewController
	withBarButtonItem:(UIBarButtonItem *)barButtonItem
	forPopoverController:(UIPopoverController *)popoverController
{
	// 为导航按钮设置Title
	barButtonItem.title = @"显示浮动导航"; 
	// 为导航条设置左边的按钮
	[self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
	// 保存显示出来的浮动窗口
	masterPopoverController = popoverController;
}
// 当分割视图固定显示左边导航航时激发该方法
// willShowViewController参数代表了代表了将要显示出来的导航栏控制器
// invalidatingBarButtonItem:参数代表了即将失效的导航按钮
- (void)splitViewController:(UISplitViewController *)splitController
	willShowViewController:(UIViewController *)viewController
	invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
	// 取消导航条左边的导航按钮
	[self.navigationItem setLeftBarButtonItem:nil animated:YES];
	// 将masterPopoverController设为null。
	masterPopoverController = nil;
}
@end
