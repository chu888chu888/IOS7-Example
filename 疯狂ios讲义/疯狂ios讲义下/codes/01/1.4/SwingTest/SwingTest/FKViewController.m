//
//  FKViewController.m
//  TapTest
//
//  Created by yeeku on 13-7-19.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FKViewController.h"
#import "FKSwingGestureRecognizer.h"

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
	// 创建手势处理器，指定使用该控制器的handleSwing:方法处理手势
	FKSwingGestureRecognizer* gesture = [[FKSwingGestureRecognizer alloc]
		initWithTarget:self action:@selector(handleSwing:)];
	// 设置该点击手势处理器只处理2个手指的摆动事件
	gesture.swingCount = 2;
	// 为gv控件添加手势处理器。
	[self.gv addGestureRecognizer:gesture];
}
// 实现手势处理器的方法，该方法应该声明一个形参。
// 当该方法被激发时，手势处理器会作为参数传给该方法的参数。
- (void) handleSwing:(FKSwingGestureRecognizer*)gesture
{
	NSUInteger touchNum = gesture.numberOfTouches;
	self.label.text = [NSString stringWithFormat:
		@"用户使用%d个手指进行摆动" , touchNum];
	// 指定2秒后清除label的文本
	[self.label performSelector:@selector(setText:)
		withObject:@"" afterDelay:2];
}
@end
