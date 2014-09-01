//
//  TouchableLabel.m
//  AppDemo
//
//  Created by chuguangming on 14-8-27.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "TouchableLabel.h"

@implementation TouchableLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
// 只追加touchesBegan:withEvent方法
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:nil message:@"我是Label" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
