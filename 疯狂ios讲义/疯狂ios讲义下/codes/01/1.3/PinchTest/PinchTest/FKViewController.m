//
//  FKViewController.m
//  TapTest
//
//  Created by yeeku on 13-7-19.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor lightGrayColor];
	self.gv.layer.borderWidth = 2;
	self.gv.layer.cornerRadius = 6;
	// 设置gv控件支持用户交互
	self.gv.userInteractionEnabled = YES;
	// 设置gv控件支持多点触碰
	self.gv.multipleTouchEnabled = YES;
	// 创建手势处理器，指定使用该控制器的handlePinch:方法处理手势
	UIPinchGestureRecognizer* gesture = [[UIPinchGestureRecognizer alloc]
		initWithTarget:self action:@selector(handlePinch:)];
	// 为gv控件添加手势处理器。
	[self.gv addGestureRecognizer:gesture];
}
// 实现手势处理器的方法，该方法应该声明一个形参。
// 当该方法被激发时，手势处理器会作为参数传给该方法的参数。
- (void) handlePinch:(UIPinchGestureRecognizer*)gesture
{
	// 获取用户捏合的速度和比例
	CGFloat velocity = gesture.velocity;
	CGFloat scale = gesture.scale;
	self.label.text = [NSString stringWithFormat:
		@"用户捏合的速度为%g、比例为%g" , velocity , scale];
	// 指定2秒后清除label的文本
	[self.label performSelector:@selector(setText:)
		withObject:@"" afterDelay:2];
}
@end
