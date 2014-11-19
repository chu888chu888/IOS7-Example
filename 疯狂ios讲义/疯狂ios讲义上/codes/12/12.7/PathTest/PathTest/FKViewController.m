//
//  FKViewController.m
//  PathTest
//
//  Created by yeeku on 13-7-31.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
CALayer* fishLayer;
NSInteger fishFrame;
NSTimer* timer;
// 定义NSMutableArray装鱼的10个动画帧
NSMutableArray* fishFrameArray;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建CALayer作为背景
	CALayer* bg = [CALayer layer];
	// 设置背景图片
	bg.contents = (id)[UIImage imageNamed:@"bg.jpg"].CGImage;
	bg.contentsGravity = kCAGravityCenter;
	bg.frame = CGRectMake(0, 0, 320, 480);
	[self.view.layer addSublayer:bg];
	fishFrameArray = [[NSMutableArray alloc] init];
	// 初始化鱼的10个动画帧，并添加到fishFrameArray集合中
	for(int i = 0 ; i < 10 ; i++)
	{
		[fishFrameArray addObject:[UIImage imageNamed:
			[NSString stringWithFormat:@"fish%d.png" , i]]];
	}
	// 创建定时器控制小鱼的动画帧的改变。
	timer = [NSTimer scheduledTimerWithTimeInterval:0.15 target:self
		selector:@selector(change) userInfo:nil repeats:YES];
	// 创建CALayer
	fishLayer = [CALayer layer];
	// 设置CALayer显示内容的对齐、缩放模式（不缩放，直接显示在中间）
	fishLayer.contentsGravity = kCAGravityCenter;
	// 设置fishLayer的大小
	fishLayer.frame = CGRectMake(128, 6, 90, 40);
	[self.view.layer addSublayer:fishLayer];
	// 创建一个按钮，通过该按钮触发小鱼的游动
	UIButton* bn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	bn.frame = CGRectMake(10 , 10 , 60 , 35);
	[bn setTitle:@"开始" forState:UIControlStateNormal];
	[self.view addSubview:bn];
	// 用户点击按钮时，激发start:方法
	[bn addTarget:self action:@selector(start:)
 		forControlEvents:UIControlEventTouchUpInside];
}
-(void) start:(id)sender
{
	// 创建对CALayer的position属性执行控制的属性动画	
	CAKeyframeAnimation* anim = [CAKeyframeAnimation
		animationWithKeyPath:@"position"];
	// 创建路径
	CGMutablePathRef movePath = CGPathCreateMutable();
	// 添加一条圆形的路径
	CGPathAddArc(movePath, nil, 170, 175, 150, -M_PI / 2, M_PI * 3 / 2, YES);
	// 设置anim动画的移动路径
	anim.path = movePath;
	// 创建对CALayer的transform属性执行控制的属性动画
	CAKeyframeAnimation* anim2 = [CAKeyframeAnimation
		animationWithKeyPath:@"transform"];
	// 指定关键帧动画的3个关键值：分别是不旋转，旋转180度，旋转360度
	anim2.values = [NSArray arrayWithObjects:
		[NSValue valueWithCATransform3D:CATransform3DIdentity],
		[NSValue valueWithCATransform3D:
			CATransform3DMakeRotation( M_PI , 0, 0, 1)],
		[NSValue valueWithCATransform3D:
			CATransform3DMakeRotation( 2 * M_PI , 0, 0, 1)]
		, nil];
	// 使用动画组来组合2个动画
	CAAnimationGroup *animGroup = [CAAnimationGroup animation];
	animGroup.animations = [NSArray arrayWithObjects:anim, anim2, nil];
	// 指定动画重复10次
	animGroup.repeatCount = 10;
	animGroup.duration = 24;
	// 为fishLayer添加动画
	[fishLayer addAnimation:animGroup forKey:@"move"];
}
// 该方法由定时器触发，不断更改fishLayer显示的动画帧
- (void) change
{
	fishLayer.contents = (id)[[fishFrameArray
		objectAtIndex:fishFrame++ % 10] CGImage];
}
@end
