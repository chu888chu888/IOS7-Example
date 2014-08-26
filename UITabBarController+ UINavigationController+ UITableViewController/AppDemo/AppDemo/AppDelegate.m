//
//  AppDelegate.m
//  AppDemo
//
//  Created by chuguangming on 14-8-15.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstTableViewController.h"
#import "SecondTableViewController.h"
#import "ThirdTableViewController.h"
@implementation AppDelegate
@synthesize firstTableController,navForftController,secondTableController,navForseController,thirdTableController,navForthirdController,rootTabBarController;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    //控制器初始化
    firstTableController=[[FirstTableViewController alloc] initWithStyle:UITableViewStylePlain];
    navForftController=[[UINavigationController alloc] initWithRootViewController:firstTableController];
    secondTableController=[[SecondTableViewController alloc]initWithStyle:UITableViewStylePlain];
    navForseController=[[UINavigationController alloc]initWithRootViewController:secondTableController];
    thirdTableController=[[ThirdTableViewController alloc]initWithStyle:UITableViewStylePlain];
    navForthirdController=[[UINavigationController alloc]initWithRootViewController:thirdTableController];
    
    //加入到TabBarController中
    NSArray * tabs=[NSArray arrayWithObjects:navForftController,navForseController,navForthirdController, nil];
    rootTabBarController=[[UITabBarController alloc] init];
    [rootTabBarController setViewControllers:tabs animated:YES];
    self.window.rootViewController=rootTabBarController;
    
    //隐藏状态条
    //[UIApplication sharedApplication].statusBarHidden = YES;
    
    [self.window makeKeyAndVisible];
    return YES;
}
//所有ViewController都不支持旋转
-(NSInteger)application:(UIApplication*)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskPortrait;
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
//所有的ViewController都不支持旋转

@end
