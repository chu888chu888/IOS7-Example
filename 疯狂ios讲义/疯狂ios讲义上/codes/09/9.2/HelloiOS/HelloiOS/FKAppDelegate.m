//
//  FKAppDelegate.m
//  HelloiOS
//
//  Created by yeeku on 13-5-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKAppDelegate.h"

#import "FKViewController.h"

@implementation FKAppDelegate
// 当应用程序启动后将会调用该方法
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// 创建UIWindow对象，并初始化该窗口的大小与主屏幕大小相同
	// 程序将创建的UIWindow对象赋值给该程序委托对象的window属性
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // 创建FKViewController对象、并使用FKViewController界面布局文件来
	// 初始化该视图控制器关联的用户界面
	self.viewController = [[FKViewController alloc] initWithNibName:@"FKViewController" bundle:nil];
	// 让该程序的窗口加载、并显示viewController视图控制器关联的用户界面
	self.window.rootViewController = self.viewController;
	// 将该UIWindow对象设为主窗口、并显示出来
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// 当应用程序从活动状态转入不活动状态时，系统将会调用该方法。
	// 通常来说的，当应用程序突然被中断（比如有电话、短信进来时），系统将会回调该方法
	// 另外，当用户离开该程序，程序开始转入后台状态时也会回调该方法。
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// 通常可通过重写该方法来释放共享资源、保存用户数据，取消定时器。
	// 开发者还可通过该方法来保存足够的状态数据，
	// 这样保证用户重新启动该应用时能正确恢复到当前状态
	// 如果该应用程序支持后台执行，当用户退出时，系统调用调用该方法，而不是调用
	// applicationWillTerminate:方法
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// 当应用程序将要进入前台时将会调用该方法。
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// 当应用程序进入前台、并转入活动状态时将会调用该方法。
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// 当应用程序被终止时，系统将会调用该方法。
}

@end
