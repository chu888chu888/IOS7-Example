//
//  UIKitPrjSliderAndLabelViewController.h
//  AppDemo
//
//  Created by chuguangming on 14-8-27.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIKitPrjSliderAndLabelViewController : UIViewController
@property(nonatomic,retain) UILabel *lblSlider;
@property(nonatomic,retain) UISlider *slider;
-(void)buttonDidPush;
@end
