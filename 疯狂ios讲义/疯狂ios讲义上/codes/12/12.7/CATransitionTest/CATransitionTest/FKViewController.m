//
//  FKViewController.m
//  CATransitionTest
//
//  Created by yeeku on 13-7-30.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FKViewController.h"

@implementation FKViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
	UIView *magentaView = [[UIView alloc] initWithFrame:self.view.bounds];
	magentaView.backgroundColor = [UIColor magentaColor];
	[self.view addSubview:magentaView];
	UIView* grayView = [[UIView alloc] initWithFrame:self.view.bounds];
	grayView.backgroundColor = [UIColor lightGrayColor];
	[self.view addSubview:grayView];
	NSArray* bnTitleArray = [NSArray arrayWithObjects:
		@"添加" , @"翻页" , @"移入" , @"揭开" ,
		@"立方体" , @"收缩" , @"翻转" , @"水波" , nil];
	NSMutableArray* bnArray = [[NSMutableArray alloc] init];
	// 获取屏幕的内部高度
	CGFloat totalHeight = [UIScreen mainScreen].bounds.size.height;
	// 创建8个按钮，并将按钮添加到NSMutableArray集合中
	for (int i = 0 ; i < 8 ; i++)
	{
		UIButton* bn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[bn setTitle:[bnTitleArray objectAtIndex:i]
			 forState:UIControlStateNormal];
		NSInteger row = i / 4;
		NSInteger col = i % 4;
		bn.frame = CGRectMake(5 + col * 80
			, totalHeight - (2 - row) * 45 - 20 , 70 , 35);
		[self.view addSubview:bn];
		[bnArray addObject:bn];
	}
	// 为8个按钮分别绑定不同的事件处理方法
	[[bnArray objectAtIndex:0] addTarget:self action:@selector(add:)
		forControlEvents:UIControlEventTouchUpInside];
	[[bnArray objectAtIndex:1] addTarget:self action:@selector(curl:)
						forControlEvents:UIControlEventTouchUpInside];
	[[bnArray objectAtIndex:2] addTarget:self action:@selector(move:)
						forControlEvents:UIControlEventTouchUpInside];
	[[bnArray objectAtIndex:3] addTarget:self action:@selector(reveal:)
						forControlEvents:UIControlEventTouchUpInside];
	[[bnArray objectAtIndex:4] addTarget:self action:@selector(cube:)
						forControlEvents:UIControlEventTouchUpInside];
	[[bnArray objectAtIndex:5] addTarget:self action:@selector(suck:)
						forControlEvents:UIControlEventTouchUpInside];
	[[bnArray objectAtIndex:6] addTarget:self action:@selector(oglFlip:)
						forControlEvents:UIControlEventTouchUpInside];
	[[bnArray objectAtIndex:7] addTarget:self action:@selector(ripple:)
						forControlEvents:UIControlEventTouchUpInside];
	NSLog(@"~~~~~~~%@" , [[self.view.subviews objectAtIndex:2] backgroundColor]);
	NSLog(@"~~~~~~~%@" , [[self.view.subviews objectAtIndex:3] backgroundColor]);
}
-(void) add:(id)sender
{
	// 开始执行动画
	[UIView beginAnimations:@"animation" context:nil];
	[UIView setAnimationDuration:1.0f];
	// 控制UIView内过渡动画的类型
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown
						   forView:self.view cache:YES];
	// 设置动画的变化曲线
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	// 提交动画
	[UIView commitAnimations];
}
-(void) curl:(id)sender
{
	// 开始执行动画
	[UIView beginAnimations:@"animation" context:nil];
	[UIView setAnimationDuration:1.0f];
	// 控制UIView内过渡动画的类型
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp
						   forView:self.view cache:YES];
	// 设置动画的变化曲线
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	// 交换视图控制器所显示的UIView中中2个子控件位置
	[self.view exchangeSubviewAtIndex:3 withSubviewAtIndex:2];
	[UIView commitAnimations];
}
-(void) move:(id)sender
{
	CATransition *transition = [CATransition animation];
	transition.duration = 2.0f;
	// 使用kCATransitionMoveIn动画
	transition.type = kCATransitionMoveIn;
	// 指定动画方向，从左向右
	transition.subtype = kCATransitionFromLeft;
	[self.view.layer addAnimation:transition forKey:@"animation"];
	[self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
}
-(void) reveal:(id)sender
{
	CATransition *transition = [CATransition animation];
	transition.duration = 2.0f;
	// 使用kCATransitionReveal动画
	transition.type = kCATransitionReveal;
	// 指定动画方向，从上到下
	transition.subtype = kCATransitionFromTop;
	[self.view.layer addAnimation:transition forKey:@"animation"];
	// 交换视图控制器所显示的UIView中中2个子控件位置
	[self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
}
-(void) cube:(id)sender
{
	CATransition *transition = [CATransition animation];
	transition.duration = 2.0f;
	// 使用@"cube"动画
	transition.type = @"cube";
	// 指定动画方向，从左到右	
	transition.subtype = kCATransitionFromLeft;
	[self.view.layer addAnimation:transition forKey:@"animation"];
	// 交换视图控制器所显示的UIView中中2个子控件位置
	[self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
}
-(void) suck:(id)sender
{
	CATransition *transition = [CATransition animation];
	transition.duration = 2.0f;
	// 使用@"suck"动画, 该动画与动画方向无关
	transition.type = @"suckEffect";
	[self.view.layer addAnimation:transition forKey:@"animation"];
	// 交换视图控制器所显示的UIView中中2个子控件位置
	[self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
}
-(void) oglFlip:(id)sender
{
	CATransition *transition = [CATransition animation];
	transition.duration = 2.0f;
	// 使用@"oglFlip"动画
	transition.type = @"oglFlip";
	// 指定动画方向为上下翻转
	transition.subtype = kCATransitionFromBottom;
	[self.view.layer addAnimation:transition forKey:@"animation"];
	// 交换视图控制器所显示的UIView中中2个子控件位置
	[self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
}
-(void) ripple:(id)sender
{
	CATransition *transition = [CATransition animation];
	transition.duration = 2.0f;
	// 使用@"rippleEffect"动画，该动画与方向无关
	transition.type = @"rippleEffect";
	[self.view.layer addAnimation:transition forKey:@"animation"];
	// 交换视图控制器所显示的UIView中中2个子控件位置
	[self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
}
@end