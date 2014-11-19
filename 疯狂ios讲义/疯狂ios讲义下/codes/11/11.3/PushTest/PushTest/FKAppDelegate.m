//
//  FKAppDelegate.m
//  PushTest
//
//  Created by yeeku on 13-10-31.
//  Copyright (c) 2013年 org.crazyit. All rights reserved.
//

#import "FKAppDelegate.h"

@implementation FKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// 注册远程推送通知
	[[UIApplication sharedApplication] registerForRemoteNotificationTypes:
		UIRemoteNotificationTypeBadge
		| UIRemoteNotificationTypeSound
		| UIRemoteNotificationTypeAlert];
	return YES;
}
- (void)application:(UIApplication *)application
	didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)pToken
{
	NSLog(@"注册成功：%@", pToken);
	// 注册成功，应该该device token发送给到Push服务端程序，
	// Push服务端程序应该将该token保存到数据库中，以备以后重复使用。
}
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
	NSLog(@"注册失败：%@",error);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
	// 处理推送消息
	UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"通知"
		message:@"我的信息" delegate:self cancelButtonTitle:@"取消"
		otherButtonTitles:nil];
	[alert show];
	NSLog(@"%@", userInfo);
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
