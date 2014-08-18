//
//  AppDelegate.h
//  AppDemo
//
//  Created by chuguangming on 14-8-15.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITableViewController *firstTableController;
@property (strong, nonatomic) UINavigationController *navForftController;
@property (strong, nonatomic) UITableViewController *secondTableController;
@property (strong, nonatomic) UINavigationController *navForseController;
@property (strong, nonatomic) UITableViewController *thirdTableController;
@property (strong, nonatomic) UINavigationController *navForthirdController;
@property (strong,nonatomic) UITabBarController *rootTabBarController;
@end
