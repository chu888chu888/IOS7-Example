//
//  FKViewController.m
//  UITabBarTest
//
//  Created by yeeku on 13-6-29.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建UITabBar对象
	UITabBar* tabBar = [[UITabBar alloc] initWithFrame:
		CGRectMake(0 ,0 ,320,44)];
	tabBar.delegate = self;
	// 将tabBar添加到标签条中
	[self.view addSubview:tabBar];
	// 使用系统图标创建标签项
	UITabBarItem* tabItem1 = [[UITabBarItem alloc]
		initWithTabBarSystemItem:UITabBarSystemItemHistory tag:0];
	// 使用用户图标创建标签项	
	UITabBarItem* tabItem2 = [[UITabBarItem alloc]
		initWithTitle:@"疯狂软件"
		image: [UIImage imageNamed:@"fkit.png"] tag:1];
	tabItem2.badgeValue = @"热";
	// 使用用户图标创建标签项
	UITabBarItem* tabItem3 = [[UITabBarItem alloc]
		initWithTitle:@"用户信息"
		image: [UIImage imageNamed:@"user.gif"] tag:2];
	// 为UITabBar设置多个标签项
 	tabBar.items = [NSArray
		arrayWithObjects:tabItem1, tabItem2 , tabItem3, nil];
}
// 由UITabBarDelegate定义的方法，当用户选中某个标签项时激发该方法。
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
	NSString* msg = [NSString stringWithFormat:@"您选中第【%d】项"
		, item.tag];
	// 创建、并显示一个UIAlertView控件
	UIAlertView* alert = [[UIAlertView alloc]
		initWithTitle:@"提示"
		message:msg
		delegate:nil
		cancelButtonTitle:@"OK"
		otherButtonTitles: nil];
	[alert show];
}
@end
