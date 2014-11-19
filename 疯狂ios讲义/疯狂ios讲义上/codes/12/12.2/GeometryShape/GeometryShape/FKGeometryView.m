//
//  FKGeometryView.m
//  GeometryShape
//
//  Created by yeeku on 13-7-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKGeometryView.h"

@implementation FKGeometryView
// 重写该方法进行绘图
- (void)drawRect:(CGRect)rect
{
	// 获取绘图上下文
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	// 设置线宽
	CGContextSetLineWidth(ctx, 16);
	CGContextSetRGBStrokeColor(ctx, 0 , 1, 0 , 1);
	// ----------下面绘制3个线段测试端点形状-----------
	// 定义4个点，绘制线段
	const CGPoint points1[] =  {CGPointMake(10 , 20), CGPointMake(90 , 20)
		,CGPointMake(90 , 20) , CGPointMake(20, 50)};
	// 绘制线段（默认不绘制端点）
	CGContextStrokeLineSegments(ctx ,points1 , 4);
	// 设置线段的端点形状：方形端点
	CGContextSetLineCap(ctx, kCGLineCapSquare);
	// 定义4个点，绘制线段
	const CGPoint points2[] =  {CGPointMake(110 , 20), CGPointMake(190 , 20)
		,CGPointMake(190 , 20) , CGPointMake(120, 50)};
	// 绘制线段
	CGContextStrokeLineSegments(ctx ,points2 , 4);
	// 设置线段的端点形状：圆形端点
	CGContextSetLineCap(ctx, kCGLineCapRound);
	// 定义4个点，绘制线段
	const CGPoint points3[] =  {CGPointMake(210 , 20), CGPointMake(300 , 20)
		,CGPointMake(300 , 20) , CGPointMake(220, 50)};
	// 绘制线段
	CGContextStrokeLineSegments(ctx ,points3 , 4);
	// ----------下面绘制3个线段测试点线模式-----------
	// 设置线段的端点形状
	CGContextSetLineCap(ctx, kCGLineCapButt);
	// 设置线宽
	CGContextSetLineWidth(ctx, 10);
	CGFloat patterns1[] = {6 , 10};
	// 设置点线模式：实线宽6，间距宽10
	CGContextSetLineDash(ctx , 0 , patterns1 , 1);
	// 定义2个点，绘制线段
	const CGPoint points4[] = {CGPointMake(40 , 65), CGPointMake(280 , 65)};
	// 绘制线段
	CGContextStrokeLineSegments(ctx ,points4 , 2);
	// 设置点线模式：实线宽6，间距宽10，但第一个实线宽为3
	CGContextSetLineDash(ctx , 3 , patterns1 , 1);
	// 定义2个点，绘制线段
	const CGPoint points5[] = {CGPointMake(40 , 85), CGPointMake(280 , 85)};
	// 绘制线段
	CGContextStrokeLineSegments(ctx ,points5 , 2);
	CGFloat patterns2[] = {5,1,4,1,3,1,2,1,1,1,1,2,1,3,1,4,1,5};
	// 设置点线模式
	CGContextSetLineDash(ctx , 0 , patterns2 , 18);
	const CGPoint points6[] = {CGPointMake(40 , 105), CGPointMake(280 , 105)};
	// 绘制线段
	CGContextStrokeLineSegments(ctx ,points6 , 2);
	// ---------下面填充矩形---------
	// 设置线条颜色
	CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
	// 设置线条宽度
	CGContextSetLineWidth(ctx, 14);
	// 设置填充颜色
	CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
	// 填充一个矩形
	CGContextFillRect(ctx , CGRectMake(30 , 120 , 120 , 60));
	// 设置填充颜色
	CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
	// 填充一个矩形
	CGContextFillRect(ctx , CGRectMake(80 , 160 , 120 , 60));
	// ---------下面绘制矩形边框---------
	// 取消设置点线模式
	CGContextSetLineDash(ctx, 0, 0, 0);
	// 绘制一个矩形边框
	CGContextStrokeRect(ctx , CGRectMake(30 , 230 , 120 , 60));
	// 设置线条颜色
	CGContextSetStrokeColorWithColor(ctx, [UIColor purpleColor].CGColor);
	// 设置线条连接点的形状
	CGContextSetLineJoin(ctx, kCGLineJoinRound);
	// 绘制一个矩形边框
	CGContextStrokeRect(ctx , CGRectMake(80 , 260 , 120 , 60));
	// 设置线条颜色
	CGContextSetRGBStrokeColor(ctx, 1.0, 0, 1.0 , 1.0);
	// 设置线条连接点的形状
	CGContextSetLineJoin(ctx, kCGLineJoinBevel);
	// 绘制一个矩形边框
	CGContextStrokeRect(ctx , CGRectMake(130 , 290 , 120 , 60));
	// 设置线条颜色
	CGContextSetRGBStrokeColor(ctx, 0, 1 , 1 , 1);
	// ---------下面绘制和填充一个椭圆---------
	// 绘制一个椭圆
	CGContextStrokeEllipseInRect(ctx , CGRectMake(30 , 380 , 120 , 60));
	// 设置填充颜色
	CGContextSetRGBFillColor(ctx, 1, 0 , 1 , 1);
	// 填充一个椭圆
	CGContextFillEllipseInRect(ctx , CGRectMake(180 , 380 , 120 , 60));
}
@end
