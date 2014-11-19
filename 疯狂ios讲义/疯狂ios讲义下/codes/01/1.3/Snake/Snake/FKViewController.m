//
//  FKViewController.m
//  Snake
//
//  Created by yeeku on 13-7-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FKViewController.h"
#import "FKSnakeView.h"

@implementation FKViewController
FKSnakeView* snakeView;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 创建FKSnakeView控件
	snakeView = [[FKSnakeView alloc] initWithFrame:
		CGRectMake(10, 30, WIDTH*CELL_SIZE , HEIGHT * CELL_SIZE)];
	// 为snakeView控件设置边框和圆角。
	snakeView.layer.borderWidth = 3;
	snakeView.layer.borderColor = [[UIColor redColor] CGColor];
	snakeView.layer.cornerRadius = 6;
	snakeView.layer.masksToBounds = YES;
	// 设置self.view控件支持用户交互
	self.view.userInteractionEnabled = YES;
	// 设置self.view控件支持多点触碰
	self.view.multipleTouchEnabled = YES;
	for (int i = 0 ; i < 4 ; i++)
	{
		// 创建手势处理器，指定使用该控制器的handleSwipe:方法处理轻扫手势
		UISwipeGestureRecognizer* gesture = [[UISwipeGestureRecognizer alloc]
			initWithTarget:self action:@selector(handleSwipe:)];
		// 设置该点击手势处理器只处理i个手指的轻扫手势
		gesture.numberOfTouchesRequired = 1;
		// 指定该手势处理器只处理1 << i方向的轻扫手势
		gesture.direction = 1 << i;
		// 为self.view控件添加手势处理器。
		[self.view addGestureRecognizer:gesture];
	}
	[self.view addSubview:snakeView];
}
// 实现手势处理器的方法，该方法应该声明一个形参。
// 当该方法被激发时，手势处理器会作为参数传给该方法的参数。
- (void) handleSwipe:(UISwipeGestureRecognizer*)gesture
{
	// 获取轻扫手势的方向
	NSUInteger direction = gesture.direction;
	switch (direction)
	{
		case UISwipeGestureRecognizerDirectionLeft:
			if(snakeView.orient != kRight) // 只要不是向右，即可改变方向
				snakeView.orient = kLeft;
			break;
		case UISwipeGestureRecognizerDirectionUp:
			if(snakeView.orient != kDown) // 只要不是向下，即可改变方向
				snakeView.orient = kUp;
			break;
		case UISwipeGestureRecognizerDirectionDown:
			if(snakeView.orient != kUp) // 只要不是向上，即可改变方向
				snakeView.orient = kDown;
			break;
		case UISwipeGestureRecognizerDirectionRight:
			if(snakeView.orient != kLeft) // 只要不是向左，即可改变方向
				snakeView.orient = kRight;
			break;
	}
}
@end
