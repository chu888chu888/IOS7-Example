//
//  FKViewController.m
//  UITextViewTest3
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
	// 创建两个菜单项
	UIMenuItem *mailShare = [[UIMenuItem alloc]initWithTitle:@"邮件分享"
		action:@selector(mailShare:)];
	UIMenuItem *weiboShare = [[UIMenuItem alloc]initWithTitle:@"微博分享"
		action:@selector(weiboShare:)];
	// 创建UIMenuController控制器
	UIMenuController *menu = [UIMenuController sharedMenuController];
	// 为UIMenuController控制器添加两个菜单项
	[menu setMenuItems:[NSArray arrayWithObjects:
		mailShare , weiboShare , nil]];
}
- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}
// 重写UIResponder的canPerformAction: withSender:方法
// 当该方法返回YES时，该界面将会显示该Action对应的控件
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
	// 如果Action是mailShare:或weiboShare:方法
	if(action == @selector(mailShare:)
	   || action == @selector(weiboShare:))
	{
		// 如果textView选中的内容长度大于0，返回YES。
		// 当该方法返回YES时，该Action对应的控件将会显示出来。
		if(self.textView.selectedRange.length > 0)
			return YES;
	}
	return NO; 
}
- (void) mailShare:(id)sender
{
	NSLog(@"模拟通过邮件分享！");
}
- (void) weiboShare:(id)sender
{
	NSLog(@"模拟通过微博分享！");
}
@end
