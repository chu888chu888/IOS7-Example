//
//  FKViewController.m
//  CAPropertyAnimationTest
//
//  Created by yeeku on 13-7-31.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FKViewController.h"

@implementation FKViewController
CALayer *imageLayer;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建一个CALayer对象
	imageLayer = [CALayer layer];
	// 设置该CALayer的边框、大小、位置等属性
	imageLayer.cornerRadius = 6;
	imageLayer.borderWidth = 1;
	imageLayer.borderColor = [UIColor blackColor].CGColor;
	imageLayer.masksToBounds = YES;
	imageLayer.frame = CGRectMake(30, 30, 100, 135);
	// 设置该imageLayer显示的图片
	imageLayer.contents = (id)[[UIImage imageNamed:@"android"] CGImage];
	[self.view.layer addSublayer:imageLayer];
	NSArray* bnTitleArray = [NSArray arrayWithObjects:@"位移"
		, @"旋转" , @"缩放" , @"动画组" , nil];
	// 获取屏幕的内部高度
	CGFloat totalHeight = [UIScreen mainScreen].bounds.size.height;
	NSMutableArray* bnArray = [[NSMutableArray alloc] init];
	// 采用循环创建4个按钮
	for(int i = 0 ; i < 4 ; i++)
	{
		UIButton* bn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		bn.frame = CGRectMake(5 + i * 80, totalHeight - 45 - 20 , 70 , 35);
		[bn setTitle:[bnTitleArray objectAtIndex:i]
			forState:UIControlStateNormal];
		[bnArray addObject:bn];
		[self.view addSubview:bn];
	}
	// 为4个按钮绑定不同的事件处理方法
	[[bnArray objectAtIndex:0] addTarget:self action:@selector(move:)
						forControlEvents:UIControlEventTouchUpInside];
	[[bnArray objectAtIndex:1] addTarget:self action:@selector(rotate:)
						forControlEvents:UIControlEventTouchUpInside];
	[[bnArray objectAtIndex:2] addTarget:self action:@selector(scale:)
						forControlEvents:UIControlEventTouchUpInside];
	[[bnArray objectAtIndex:3] addTarget:self action:@selector(group:)
						forControlEvents:UIControlEventTouchUpInside];
}
-(void) move:(id)sender
{
	CGPoint fromPoint = imageLayer.position;
	CGPoint toPoint = CGPointMake(fromPoint.x + 80 , fromPoint.y);
	// 创建不断改变CALayer的position属性的属性动画
	CABasicAnimation* anim = [CABasicAnimation
		animationWithKeyPath:@"position"];
	// 设置动画开始的属性值
	anim.fromValue = [NSValue valueWithCGPoint:fromPoint];
	// 设置动画结束的属性值
	anim.toValue = [NSValue valueWithCGPoint:toPoint];
	anim.duration = 0.5;
	imageLayer.position = toPoint;
	anim.removedOnCompletion = YES;
	// 为imageLayer添加动画
	[imageLayer addAnimation:anim forKey:nil];
}
-(void) rotate:(id)sender
{
	// 创建不断改变CALayer的transform属性的属性动画
	CABasicAnimation* anim = [CABasicAnimation animationWithKeyPath:@"transform"];
	CATransform3D fromValue = imageLayer.transform;
	// 设置动画开始的属性值
	anim.fromValue = [NSValue valueWithCATransform3D:fromValue];
	// 绕X轴旋转180度
	CATransform3D toValue = CATransform3DRotate(fromValue, M_PI , 1 , 0 , 0);
	// 绕Y轴旋转180度
//	CATransform3D toValue = CATransform3DRotate(fromValue, M_PI , 0 , 1 , 0);
//	// 绕Z轴旋转180度
//	CATransform3D toValue = CATransform3DRotate(fromValue, M_PI , 0 , 0 , 1);
	// 设置动画结束的属性值
	anim.toValue = [NSValue valueWithCATransform3D:toValue];
	anim.duration = 0.5;
	imageLayer.transform = toValue;
	anim.removedOnCompletion = YES;
	// 为imageLayer添加动画
	[imageLayer addAnimation:anim forKey:nil];
}
-(void) scale:(id)sender
{
	// 创建不断改变CALayer的transform属性的属性动画
	CAKeyframeAnimation* anim = [CAKeyframeAnimation
		animationWithKeyPath:@"transform"];
	// 设置CAKeyframeAnimation控制transform属性依次经过的属性值
	anim.values = [NSArray arrayWithObjects:
		[NSValue valueWithCATransform3D:imageLayer.transform],
		[NSValue valueWithCATransform3D:CATransform3DScale
		 	(imageLayer.transform , 0.2, 0.2, 1)],
		[NSValue valueWithCATransform3D:CATransform3DScale
		 	(imageLayer.transform, 2, 2 , 1)],
		[NSValue valueWithCATransform3D:imageLayer.transform], nil];
	anim.duration = 5;
	anim.removedOnCompletion = YES;
	// 为imageLayer添加动画
	[imageLayer addAnimation:anim forKey:nil];
}
-(void) group:(id)sender
{
	CGPoint fromPoint = imageLayer.position;
	CGPoint toPoint = CGPointMake(280 , fromPoint.y + 300);
	// 创建不断改变CALayer的position属性的属性动画	
	CABasicAnimation* moveAnim = [CABasicAnimation
		animationWithKeyPath:@"position"];
	// 设置动画开始的属性值	
	moveAnim.fromValue = [NSValue valueWithCGPoint:fromPoint];
	// 设置动画结束的属性值	
	moveAnim.toValue = [NSValue valueWithCGPoint:toPoint];
	moveAnim.removedOnCompletion = YES;
	// 创建不断改变CALayer的transform属性的属性动画	
	CABasicAnimation* transformAnim = [CABasicAnimation
		animationWithKeyPath:@"transform"];
	CATransform3D fromValue = imageLayer.transform;
	// 设置动画开始的属性值
	transformAnim.fromValue = [NSValue valueWithCATransform3D: fromValue];
	// 创建缩放为X、Y两个方向上缩放为0.5的变换矩阵
	CATransform3D scaleValue = CATransform3DScale(fromValue , 0.5 , 0.5, 1);
	// 绕Z轴旋转180度的变换矩阵
	CATransform3D rotateValue = CATransform3DRotate(fromValue, M_PI , 0 , 0 , 1);
	// 计算两个变换矩阵的和
	CATransform3D toValue = CATransform3DConcat(scaleValue, rotateValue);
	// 设置动画技术的属性值	
	transformAnim.toValue = [NSValue valueWithCATransform3D:toValue];
	// 动画效果累加
	transformAnim.cumulative = YES;
	// 动画重复执行2次，旋转360度
	transformAnim.repeatCount = 2;
	transformAnim.duration = 3;
	// 位移、缩放、旋转组合起来执行
	CAAnimationGroup *animGroup = [CAAnimationGroup animation];
	animGroup.animations = [NSArray arrayWithObjects:moveAnim
		, transformAnim , nil];
	animGroup.duration = 6;
	// 为imageLayer添加动画
	[imageLayer addAnimation:animGroup forKey:nil];
}
@end
