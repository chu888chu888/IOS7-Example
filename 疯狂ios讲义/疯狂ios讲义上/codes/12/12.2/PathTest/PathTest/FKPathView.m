//
//  FKPathView.m
//  PathTest
//
//  Created by yeeku on 13-7-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKPathView.h"
#import "FKContext.h"

@implementation FKPathView
- (void)drawRect:(CGRect)rect
{
	// 获取绘图CGContextRef
    CGContextRef ctx = UIGraphicsGetCurrentContext();
	// 开始添加路径
	CGContextBeginPath(ctx);
	// 添加一个五角星的路径
	CGContextAddStar(ctx, 5, 80, 150, 40);
	// 添加一个圆角矩形的路径
	CGContextAddRoundRect(ctx, 10, 30, 150, 70, 14);
	// 关闭路径
	CGContextClosePath(ctx);
	// 设置线条颜色
	CGContextSetRGBStrokeColor(ctx, 1, 1, 0, 1);
	// 设置线宽
	CGContextSetLineWidth(ctx, 4);
	// 绘制路径
	CGContextStrokePath(ctx);
	// 开始添加路径
	CGContextBeginPath(ctx);
	// 添加一个五角星的路径
	CGContextAddStar(ctx, 5, 240, 150, 40);
	// 添加一个圆角矩形的路径
	CGContextAddRoundRect(ctx, 170, 30, 130, 70, 14);
	// 关闭路径
	CGContextClosePath(ctx);
	// 设置填充颜色
	CGContextSetRGBFillColor(ctx, 1, 0, 1, 1);
	// 采用填充并绘制路径的方式来绘制路径
	CGContextDrawPath(ctx, kCGPathFillStroke);
	// 开始添加路径
	CGContextBeginPath(ctx);
	// 添加一个3角星的路径
	CGContextAddStar(ctx, 3, 60, 220, 40);
	// 关闭路径
	CGContextClosePath(ctx);
	// 设置填充颜色
	CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
	// 填充路径
	CGContextFillPath(ctx);
	// 开始添加路径
	CGContextBeginPath(ctx);
	// 添加一个7角星的路径
	CGContextAddStar(ctx, 7, 160, 220, 40);
	// 关闭路径
	CGContextClosePath(ctx);
	// 设置填充颜色
	CGContextSetRGBFillColor(ctx, 0, 1, 0, 1);
	// 填充路径
	CGContextFillPath(ctx);
	// 开始添加路径
	CGContextBeginPath(ctx);
	// 添加一个9角星的路径
	CGContextAddStar(ctx, 9, 260, 220, 40);
	// 关闭路径
	CGContextClosePath(ctx);
	// 设置填充颜色
	CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
	// 填充路径
	CGContextFillPath(ctx);
}
@end
