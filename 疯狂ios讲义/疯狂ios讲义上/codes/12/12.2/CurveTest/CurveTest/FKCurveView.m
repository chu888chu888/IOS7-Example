//
//  FKCurveView.m
//  CurveTest
//
//  Created by yeeku on 13-7-11.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKCurveView.h"
#import "FKContext.h"

@implementation FKCurveView
- (void)drawRect:(CGRect)rect
{
	// 获取绘图的CGContextRef
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	// 开始添加路径
	CGContextBeginPath(ctx);
	// 添加5瓣花朵的路径
	CGContextAddFlower(ctx , 5 , 50 , 100 , 30 , 80);
	// 设置填充颜色
	CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
	CGContextFillPath(ctx);
	// 添加6瓣花朵的路径
	CGContextAddFlower(ctx , 6 , 160 , 100 , 30 , 80);
	// 设置填充颜色
	CGContextSetRGBFillColor(ctx, 1, 1, 0, 1);
	CGContextFillPath(ctx);
	// 添加7瓣花朵的路径
	CGContextAddFlower(ctx , 7 , 270 , 100 , 30 , 80);
	// 设置填充颜色
	CGContextSetRGBFillColor(ctx, 1, 0, 1, 1);
	CGContextFillPath(ctx);
	// 关闭路径
	CGContextClosePath(ctx);
}
@end
