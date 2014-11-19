//
//  FKAppDelegate.h
//  UINavigationControllerTest
//
//  Created by yeeku on 13-6-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FKBookViewController;

@interface FKAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) FKBookViewController *viewController;
@property (strong, nonatomic) UINavigationController *naviController;

@end
