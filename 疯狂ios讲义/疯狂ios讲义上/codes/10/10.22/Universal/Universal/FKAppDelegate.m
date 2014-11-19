//
//  FKAppDelegate.m
//  UISplitViewTest
//
//  Created by yeeku on 13-6-30.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKAppDelegate.h"

#import "FKMasterViewController.h"
#import "FKDetailViewController.h"

@implementation FKAppDelegate

- (BOOL)application:(UIApplication *)application
	didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	self.books = [NSMutableArray arrayWithObjects:@"疯狂XML讲义"
		, @"疯狂Ajax讲义" , @"轻量级Java EE企业应用实战"
		, @"疯狂Android讲义"
		, @"疯狂HTML5/CSS3/JavaScript讲义" , nil];
	self.bookCovers = [NSDictionary dictionaryWithObjectsAndKeys:
		@"xml.png", @"疯狂XML讲义",
		@"ajax.png", @"疯狂Ajax讲义",
		@"javaee.png" , @"轻量级Java EE企业应用实战",
		@"android.png" , @"疯狂Android讲义",
		@"html.png", @"疯狂HTML5/CSS3/JavaScript讲义" , nil];
	// 创建程序窗口
	self.window = [[UIWindow alloc] initWithFrame:
				   [[UIScreen mainScreen] bounds]];
	// 创建FKMasterViewController控制器——左侧导航栏
	FKMasterViewController *masterController = [[FKMasterViewController alloc]
		initWithStyle:UITableViewStyleGrouped];
	// 使用UINavigationController包装FKMasterViewController
	// 作用是让FKMasterViewController上面显示一个导航条
	UINavigationController *masterNavigationController =
		[[UINavigationController alloc]
		initWithRootViewController:masterController];
	// 创建FKDetailViewController控制器——右边详细信息
	FKDetailViewController *detailController = [[FKDetailViewController alloc]
		initWithNibName:@"FKDetailViewController" bundle:nil];
	// 使用UINavigationController包装FKDetailViewController
	// 作用是让FKDetailViewController上面显示一个导航条
	UINavigationController *detailNavigationController =
		[[UINavigationController alloc]
		initWithRootViewController:detailController];
	masterController.detailViewController = detailController;
	// 如果运行设备为iPhone
	if ([[UIDevice currentDevice] userInterfaceIdiom]
		== UIUserInterfaceIdiomPhone)
	{
		// 直接使用masterNavigationController作为应用窗口的根控制器
		self.window.rootViewController = masterNavigationController;
	}
	// 如果运行设备为iPad
	else
	{
		self.splitViewController = [[UISplitViewController alloc] init];
		// 为UISplitView设置delegate对象
		self.splitViewController.delegate = detailController; // ①
		// 设置UISplitView所管理的左、右两个UIViewController
		self.splitViewController.viewControllers =
  			@[masterNavigationController, detailNavigationController];
		self.window.rootViewController = self.splitViewController;
	}
	[self.window makeKeyAndVisible];
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
