//
//  GlobalViewController.h
//  weChat
//
//  Created by apple on 14-8-21.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONKit.h"
#import "UIViewController+functions.h"
#import "GlobalNavigationViewController.h"


@interface GlobalViewController : UIViewController<DSJSONRPCDelegate>

@property (nonatomic,strong) NSDictionary *home;
@property (nonatomic,strong) NSString *beforeDay;
@property (nonatomic,strong) NSString *distance;
@property (nonatomic) UIAlertView *promptAlert;

@property (nonatomic,strong) DSJSONRPC *jsonRPC;
- (void)RPCUseClass:(NSString *)ClassName callMethodName:(NSString *)methodName withParameters:(NSDictionary *)parameters onCompletion:(DSJSONRPCCompletionHandler)completionHandler;
- (void)removeInfo;



@end
