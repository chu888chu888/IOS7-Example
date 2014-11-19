//
//  FKDashLineView.m
//  DashLineTest
//
//  Created by yeeku on 13-7-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKDashLineView.h"

@implementation FKDashLineView
@synthesize dashPhase;
-(id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if(self != nil)
	{
		self.opaque = YES;
		self.backgroundColor = [UIColor blackColor];
		// 设置每次清空上一次绘制的内容
		self.clearsContextBeforeDrawing = YES;
		dashCount = 0;
		dashPhase = 0.0;
	}
	return self;
}
-(void)setDashPhase:(CGFloat)phase
{
	// 如果新传入的
	if(phase != dashPhase)
	{
		// 对dashPhase赋值
		dashPhase = phase;
		// 通知该控件重绘自己
		[self setNeedsDisplay];
	}
}
-(void)setDashPattern:(CGFloat *)pattern count:(size_t)count
{
	// 如果count与dashCount不相等，或者dashPattern数组与pattern数组不相等
	if((count != dashCount) || (memcmp(dashPattern, pattern
		, sizeof(CGFloat) * count) != 0))
	{
		// 将pattern数组的值复制到dashPattern数组中
		memcpy(dashPattern, pattern, sizeof(CGFloat) * count);
		// 对dashCount赋值
		dashCount = count;
		// 通知该控件重绘自己
		[self setNeedsDisplay];
	}
}
// 重写该方法，绘制该控件
-(void)drawRect:(CGRect)rect
{
	// 获取绘图上下文
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	// 设置线条颜色
	CGContextSetRGBStrokeColor(ctx, 1.0, 0.0, 1.0, 1.0);
	// 设置线宽
	CGContextSetLineWidth(ctx, 2.0);
	// 设置点线模式
	CGContextSetLineDash(ctx, dashPhase, dashPattern, dashCount);
	CGPoint line1[] = {CGPointMake(10.0, 20.0), CGPointMake(310.0, 20.0)};
	// 绘制一条线段
	CGContextStrokeLineSegments(ctx, line1, 2);
	CGPoint line2[] = {CGPointMake(160.0, 130.0), CGPointMake(160.0, 130.0)};
	// 绘制一条线段
	CGContextStrokeLineSegments(ctx, line2, 2);
	// 绘制一个矩形
	CGContextStrokeRect(ctx, CGRectMake(10.0, 30.0, 100.0, 100.0));
	// 绘制一个椭圆
	CGContextStrokeEllipseInRect(ctx, CGRectMake(210.0, 30.0, 100.0, 100.0));
}
@end
