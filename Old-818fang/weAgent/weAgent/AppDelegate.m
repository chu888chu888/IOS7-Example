//
//  AppDelegate.m
//  weChat
//
//  Created by apple on 14-8-19.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
// 引用 IMKit 头文件。
//#import "RCIM.h"




@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    //    // 要使用百度地图，请先启动BaiduMapManager
    //    _mapManager = [[BMKMapManager alloc] init];
    //    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    //    BOOL ret = [_mapManager start:@"MoO4vYYxaFWD36qgXGWrCxX4"  generalDelegate:nil];
    //    if (!ret) {
    //        NSLog(@"manager start failed!");
    //    }
    
    
    
    
    // 注册苹果推送，申请推送权限。
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeSound|UIRemoteNotificationTypeAlert)];
    
    
    
    
    //    // 初始化 DemoViewController。
    //    DemoViewController *viewController = [[DemoViewController alloc]initWithNibName:nil bundle:nil];
    //
    //    // 初始化 UINavigationController。
    //    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    //
    //    // 初始化 rootViewController。
    //    self.window.rootViewController = nav;
    
    
    
    
    //判断程序是否是第一次运行
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
    }
    else{
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
        IntroduceViewController *introduceVC = [[IntroduceViewController alloc] init];
        //将跳转委托为自己
        introduceVC.toNextViewDetegate = self;
        self.window.rootViewController = introduceVC;
        
        
    }else{
        
        //实例化rootViewController
        RootViewController *rootVC = [[RootViewController alloc] init];
        self.window.rootViewController = rootVC;
        
    }
    
    
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(void)toNextView{
    
    RootViewController *rootVC = [[RootViewController alloc] init];
    self.window.rootViewController = rootVC;
    
}



// 获取苹果推送权限成功。
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // 初始化 SDK，传入 App Key 和 deviceToken。
    //    [RCIM initWithAppKey:@"lmxuhwagxrlwd" deviceToken:deviceToken];
}

// 获取苹果推送权限失败。
-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    // 初始化 SDK，传入 App Key，deviceToken 直接传入空值。
    //    [RCIM initWithAppKey:@"lmxuhwagxrlwd" deviceToken:nil];
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
