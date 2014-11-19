//
//  FKAppDelegate.h
//  AFNetworkingXML
//
//  Created by yeeku on 13-10-3.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPRequestOperationManager.h"

@interface FKAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;
@end
