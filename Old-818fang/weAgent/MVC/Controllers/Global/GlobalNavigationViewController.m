//
//  GlobalNavigationViewController.m
//  weChat
//
//  Created by apple on 14-9-12.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//
#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#import "GlobalNavigationViewController.h"

@interface GlobalNavigationViewController ()

@end

@implementation GlobalNavigationViewController
#pragma mark 一个类只会调用一次
+ (void)initialize
{
    // 1.取出设置主题的对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 2.设置导航栏的背景图片
    if (iOS7) { // iOS7
            navBar.barTintColor = [UIColor baseColor];
    }
    // 3.标题
    [navBar setTitleTextAttributes:@{
                                     UITextAttributeTextColor : [UIColor whiteColor]
                                     }];
    //4.按钮颜色
    navBar.tintColor = [UIColor whiteColor];
}

#pragma mark 控制状态栏的样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
