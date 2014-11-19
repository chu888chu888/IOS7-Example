//
//  FKAppDelegate.h
//  UISplitViewTest
//
//  Created by yeeku on 13-6-30.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSMutableArray* books;
@property (strong, nonatomic) NSDictionary* bookCovers;

@property (strong, nonatomic) UISplitViewController* splitViewController;

@end
