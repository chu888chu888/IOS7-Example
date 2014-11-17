//
//  UIBarButtonItem+base.m
//  weChat
//
//  Created by apple on 14-9-15.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "UIBarButtonItem+base.h"

@implementation UIBarButtonItem (base)
- (void)formatToBase{
    [self setTintColor:[UIColor whiteColor]];
    [self setTitleTextAttributes:@{ UITextAttributeFont: [UIFont baseWithSize:14.0]}  forState:UIControlStateNormal];
}


@end
