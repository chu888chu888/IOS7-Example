//
//  UIViewController+functions.h
//  weChat
//
//  Created by apple on 14-9-13.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONKit.h"
#import "DSJSONRPC.h"
#import "UIBarButtonItem+base.h"
#import "UIButton+base.h"
#import "UIColor+base.h"

@interface UIViewController (functions)
- (NSUserDefaults*)getUserInfo;
- (NSString *)formatToJsonString:(NSDictionary *)certificate;
- (void)addBackButton;
- (void)backHandle;
- (void)loginHandle;
- (void)registerHandle;
- (void)findPasswordHandle;
- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;
- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;
- (UIImage *)getImageFromView:(UIView *)theView;


@end
