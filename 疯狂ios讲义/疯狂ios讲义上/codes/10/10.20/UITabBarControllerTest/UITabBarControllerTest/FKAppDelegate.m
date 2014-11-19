//
//  FKAppDelegate.m
//  UITabBarControllerTest
//
//  Created by yeeku on 13-6-29.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKAppDelegate.h"

#import "FKViewController.h"
#import "FKBookListController.h"

@implementation FKAppDelegate

- (BOOL)application:(UIApplication *)application
	didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// 创建程序窗口
	self.window = [[UIWindow alloc] initWithFrame:
		[[UIScreen mainScreen] bounds]];
	// 创建UITabBarController
	self.tabBarController = [[UITabBarController alloc] init];
	// 创建FKViewController对象
	FKViewController* viewController = [[FKViewController alloc]
		initWithNibName:@"FKViewController" bundle:nil];
	// 创建FKBookListController对象
	FKBookListController* bookListController = [[FKBookListController alloc]
		initWithStyle:UITableViewStyleGrouped];
	// 为UITabBarController设置多个视图控制器
	// 如果希望UITabBarController显示几个Tab页，
	// 就为UITabBarController添加几个视图控制器
	self.tabBarController.viewControllers = [NSArray
		arrayWithObjects:bookListController
		, viewController, nil];
	// 将UITabBarController设置为窗口的根控制器
	self.window.rootViewController = self.tabBarController;
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
