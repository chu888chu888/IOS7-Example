//
//  FKAppDelegate.m
//  UIPageViewControllerTest
//
//  Created by yeeku on 13-6-30.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKAppDelegate.h"

#import "FKPageController.h"

@implementation FKAppDelegate

- (BOOL)application:(UIApplication *)application
	didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// 创建程序窗口
	self.window = [[UIWindow alloc] initWithFrame:
		[[UIScreen mainScreen] bounds]];
	// 创建FKPageController控制器
	FKPageController *pageZero = [[FKPageController alloc]
								  initWithPageNumber:0];
	// 创建一个NSDictionary对象，作为创建UIPageViewController的选项。
	// 该选项只支持2个key：
	// UIPageViewControllerOptionSpineLocationKey：指定翻页效果中“书脊”的位置
	// UIPageViewControllerOptionInterPageSpacingKey：指定2个页面之间间距
	NSDictionary* options = [NSDictionary dictionaryWithObjectsAndKeys:
	[NSNumber numberWithInt:UIPageViewControllerSpineLocationMin],
	UIPageViewControllerOptionSpineLocationKey,
	[NSNumber numberWithFloat:0],
	UIPageViewControllerOptionInterPageSpacingKey , nil];
	// 创建UIPageViewController
	UIPageViewController *pageViewController =
		[[UIPageViewController alloc]
		// 设置页面过度效果：此处使用书页卷动的翻页效果
		initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
		// 设置页面的翻页方向：此处使用水平翻页
		navigationOrientation:
		UIPageViewControllerNavigationOrientationHorizontal
		options:options];
	// 设置使用支持双面
	pageViewController.doubleSided = YES;
	// 为UIPageViewController设置delegate
	pageViewController.dataSource = self;
	// 设置UIPageViewController管理的视图控制器
	[pageViewController setViewControllers:@[pageZero]
	 	// 指定向前翻页
		direction:UIPageViewControllerNavigationDirectionForward
		animated:YES
		completion:nil];
	// 设置程序窗口的根控制器为pageViewController
	self.window.rootViewController = pageViewController;
	[self.window makeKeyAndVisible];
	return YES;
}
// 当用户控制UIPageViewController向前翻页时调用该方法
- (FKPageController *)pageViewController:(UIPageViewController *)pvc
	viewControllerBeforeViewController:(FKPageController *)vc
{
	// 如果当前pageIndex大于0，将pageIndex-1作为参数创建FKPageController
	if (vc.pageIndex > 0)
	{

		NSUInteger index = vc.pageIndex;
		return [[FKPageController alloc]
			initWithPageNumber:index - 1];
	}
	else
	{
		NSUInteger index = vc.pageIndex;
		return [[FKPageController alloc]
			initWithPageNumber:index];
	}
}
// 当用户控制UIPageViewController向后翻页时调用该方法
- (FKPageController *)pageViewController:(UIPageViewController *)pvc
	viewControllerAfterViewController:(FKPageController *)vc
{
	// 将pageIndex-1作为参数创建FKPageController
	NSUInteger index = vc.pageIndex;
	return [[FKPageController alloc]
		initWithPageNumber:index + 1];
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
