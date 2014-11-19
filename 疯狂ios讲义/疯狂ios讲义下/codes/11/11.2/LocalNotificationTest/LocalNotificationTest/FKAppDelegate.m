//
//  FKAppDelegate.m
//  LocalNotificationTest
//
//  Created by yeeku on 13-10-31.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKAppDelegate.h"

@implementation FKAppDelegate
// 只有当应用在前台时，该方法才会被调用
- (void)application:(UIApplication *)application
	didReceiveLocalNotification:(UILocalNotification*)notification{
	// 如果应用程序在前台，将应用程序图标上红色徽标中数字设为0
	application.applicationIconBadgeNumber = 0;
	// 使用UIAlertView显示本地通知的信息
	[[[UIAlertView alloc] initWithTitle:@"收到通知"
		message:notification.alertBody
		delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
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
	// 应用程序再次进入前台时，将应用程序徽标设置0
	application.applicationIconBadgeNumber = 0;
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
