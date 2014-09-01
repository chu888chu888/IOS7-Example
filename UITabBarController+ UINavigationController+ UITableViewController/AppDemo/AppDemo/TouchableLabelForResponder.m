//
//  TouchableLabelForResponder.m
//  AppDemo
//
//  Created by chuguangming on 14-8-28.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "TouchableLabelForResponder.h"

@implementation TouchableLabelForResponder

-(id) init
{
    if (self==[super init]) {
        //将userInteractionEnabled设置为YES
        self.userInteractionEnabled=YES;
        //设置自动调整,以免充分设置
        self.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
        
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //检测到触摸后,首先将标签标题输出到日志中
    NSLog(@"开始触摸%@",self.text);
    //但是事件传导到下一个相应控件
    [self.nextResponder touchesBegan:touches withEvent:event];
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    //检测到触摸后,首先将标签标题输出到日志中
    NSLog(@"取消触摸%@",self.text);
    //但是事件传导到下一个相应控件
    [self.nextResponder touchesCancelled:touches withEvent:event];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //检测到触摸后,首先将标签标题输出到日志中
    NSLog(@"结束触摸%@",self.text);
    //但是事件传导到下一个相应控件
    [self.nextResponder touchesEnded:touches withEvent:event];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //检测到触摸后,首先将标签标题输出到日志中
    NSLog(@"触摸移动%@",self.text);
    //但是事件传导到下一个相应控件
    [self.nextResponder touchesMoved:touches withEvent:event];
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
