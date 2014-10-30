//
//  AppDelegate.h
//  weChat
//
//  Created by apple on 14-8-19.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSJSONRPC.h"
//#import "BMapKit.h"
#import "IntroduceViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate,NextViewDelegate>{
    //    BMKMapManager* _mapManager;
    
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) DSJSONRPC *_jsonRPC;

@end
