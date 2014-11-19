//
//  FKCheckGestureRecognizer.m
//  CheckTest
//
//  Created by yeeku on 13-7-19.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIGestureRecognizerSubclass.h>
#import "FKSwingGestureRecognizer.h"

@implementation FKSwingGestureRecognizer
// 记录起始点的Y坐标
CGFloat baseY;
CGFloat prevX;
NSInteger count;
NSUInteger prevDir; // 定义手势移动方向，1代表向右，2代表向左
- (void) touchesBegan:(NSSet*) touches withEvent:(UIEvent*) event
{
	[super touchesBegan:touches withEvent:event];
	// 获取多个触碰点中任意一个触碰点
	UITouch* touch = [touches anyObject];
	// 获取触碰点在self.view中的坐标
	CGPoint point = [touch locationInView:self.view];
	baseY = point.y;
	prevX = point.x;
	count = 0;
	prevDir = 0;
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	[super touchesMoved:touches withEvent:event];
	UITouch* touch = [touches anyObject];
	CGPoint currPoint = [touch locationInView:self.view];
	// 如果垂直方向上移动距离过大，则取消手势
	if(fabs(currPoint.y - baseY) > 10)
	{
		self.state = UIGestureRecognizerStateCancelled;
		return;
	}
	NSUInteger currDir = currPoint.x > prevX ? 1 : 2;
	// 刚开始还没有初始化方向时
	if(prevDir == 0)
	{
		prevDir = currDir;
	}
	// 如果前一次的移动方向与当前移动方向不同，可也将“摆动”次数加1
	if(prevDir != currDir)
	{
		// 将“摆动”次数加1
		count++;
		// 使用prevDir记录当前的摆动方向
		prevDir = currDir;
	}
	// 如果改变方向的次数超过了该手势处理器要求的次数，即可判断手势成功
	if(count >= self.swingCount)
	{
		self.state = UIGestureRecognizerStateEnded;
	}
}
@end
