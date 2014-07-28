//
//  BrightnessViewController.h
//  TabControllerDemo2
//
//  Created by chuguangming on 14-7-22.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrightnessViewController : UIViewController
@property(nonatomic) int brightness;

+(id)controllerWithBrightness:(int) brightness;
@end
