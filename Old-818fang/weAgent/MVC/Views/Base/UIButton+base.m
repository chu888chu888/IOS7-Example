//
//  UIButton+base.m
//  weChat
//
//  Created by apple on 14-9-15.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "UIButton+base.h"

@implementation UIButton (base)
- (void)formatToBase{
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:8.0]; //设置矩圆角半径
    [self.layer setBorderWidth:1.0];   //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 15/255.0, 172/255.0, 237/255.0, 1 });
    [self.layer setBorderColor:colorref];//边框颜色
}


- (void)beOrange
{
    [self btnWith:@"btn_orange"];
}

- (void)beBlue
{
    [self btnWith:@"btn_blue"];
}

- (void)btnWith:(NSString *)btnString
{
   
    [self setBackgroundImage:[[UIImage imageNamed:btnString] beResize]  forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)beRed
{
    [self btnWith:@"btn_red"];
}


- (void)beBlueLink{
    [self setTitleColor:[UIColor baseColor] forState:UIControlStateNormal];
    [self.titleLabel setFont:[UIFont baseWithSize:14.0]];
}

@end
