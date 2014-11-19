//
//  FKAppDelegate.m
//  NetStatus
//
//  Created by yeeku on 13-9-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKAppDelegate.h"
#import "Reachability.h"

@implementation FKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
// 使用通知中心监听kReachabilityChangedNotification通知
[[NSNotificationCenter defaultCenter] addObserver:self
	selector:@selector(reachabilityChanged:)
	name:kReachabilityChangedNotification object:nil];
// 获取访问指定站点的Reachability对象
Reachability* reach = [Reachability
	reachabilityWithHostName:@"www.crazyit.org"];
// 让Reachability对象开启被监听状态
[reach startNotifier];
	// Override point for customization after application launch.
	return YES;
}
- (void)reachabilityChanged:(NSNotification *)note
{
	// 通过通知对象获取被监听的Reachability对象
	Reachability *curReach = [note object];
	// 获取Reachability对象的网络状态
	NetworkStatus status = [curReach currentReachabilityStatus];
	if (status == NotReachable)
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒"
			message:@"不能访问www.crazyit.org" delegate:nil
			cancelButtonTitle:@"YES" otherButtonTitles:nil];
		[alert show];
	}
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
