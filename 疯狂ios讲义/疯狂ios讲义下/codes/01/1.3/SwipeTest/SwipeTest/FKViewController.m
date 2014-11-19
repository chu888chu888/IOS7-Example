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
	for (int i = 0 ; i < 4 ; i++)
	{
		// 创建手势处理器，指定使用该控制器的handleSwipe:方法处理轻扫手势
		UISwipeGestureRecognizer* gesture = [[UISwipeGestureRecognizer alloc]
			initWithTarget:self action:@selector(handleSwipe:)];
		// 设置该点击手势处理器只处理i个手指的轻扫手势
		gesture.numberOfTouchesRequired = 1;
		// 指定该手势处理器只处理1 << i方向的轻扫手势
		gesture.direction = 1 << i;
		// 为gv控件添加手势处理器。
		[self.gv addGestureRecognizer:gesture];
	}
}
// 实现手势处理器的方法，该方法应该声明一个形参。
// 当该方法被激发时，手势处理器会作为参数传给该方法的参数。
- (void) handleSwipe:(UISwipeGestureRecognizer*)gesture
{
	// 获取轻扫手势的方向
	NSUInteger direction = gesture.direction;
	// 根据手势方向的值得到方向字符串
	NSString* dirStr = direction == UISwipeGestureRecognizerDirectionRight
		? @"向右" : (direction == UISwipeGestureRecognizerDirectionLeft
		? @"向左" : (direction == UISwipeGestureRecognizerDirectionUp
		? @"向上" :@"向下"));
	NSUInteger touchNum = gesture.numberOfTouchesRequired;
	self.label.text = [NSString stringWithFormat:
		@"用户使用%d个手指进行轻扫，方向为：%@" , touchNum , dirStr];
	// 指定2秒后清除label的文本
	[self.label performSelector:@selector(setText:)
		withObject:@"" afterDelay:2];
}
@end
