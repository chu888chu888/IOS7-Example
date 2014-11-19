//
//  FKDrawView.m
//  HandDraw
//
//  Created by yeeku on 13-7-11.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKDrawView.h"
#import "FKContext.h"

@implementation FKDrawView
CGPoint firstTouch, prevTouch, lastTouch;
// 定义向内存中图片执行绘图的CGContextRef
CGContextRef buffCtx;
UIImage* image;
- (id)initWithCoder:(NSCoder*)aCoder
{
	self = [super initWithCoder:aCoder];
	if (self) {
		// 初始化时将当前颜色设为红色
		self.currentColor = [UIColor redColor];
		// 创建内存中的图片
		UIGraphicsBeginImageContext(self.bounds.size);
		// 获取向内存中图片执行绘图的CGContextRef
		buffCtx = UIGraphicsGetCurrentContext();
	}
	return self;
}
// 当用户手指开始触碰时激发该方法
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	// 获取触碰点坐标
	firstTouch = [touch locationInView:self];
	// 如果当前正在进行自由绘制，prevTouch代表第一个触碰点
	if (self.shape == kPenShape)
	{
		prevTouch = firstTouch;
	}
}
// 当用户手指在控件上拖动时不断地激发该方法
- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	// 获取触碰点坐标
	lastTouch = [touch locationInView:self];
	// 如果当前正在进行自由绘制
	if (self.shape == kPenShape)
	{
		// 向内存中的图片执行绘制
		[self draw:buffCtx];
		// 取出内存中的图片，保存到image中
		image = UIGraphicsGetImageFromCurrentImageContext();
	}
	// 通知该控件重绘，此时会实时地绘制起始点与用户手指拖动点之间的形状
	[self setNeedsDisplay];
}
// 当用户手指离开控件时激发该方法
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	// 获取离开触碰的点坐标	
	lastTouch = [touch locationInView:self];
	// 向内存中的图片执行绘制，即把最终确定图形绘制到内存中图片上
	[self draw:buffCtx];
	image = UIGraphicsGetImageFromCurrentImageContext();
	// 通知重绘。
	[self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
	// 获取绘图上下文
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	// 将内存中的图片绘制出来
	[image drawAtPoint:CGPointZero];
	// 调用draw:方法执行绘制
	[self draw:ctx];
}
// 定义一个函数，用于根据firstTouch、lastTouch来确定矩形区域
- (CGRect) curRect
{
	return CGRectMake(firstTouch.x, firstTouch.y,
		lastTouch.x - firstTouch.x ,
		lastTouch.y - firstTouch.y);
}
- (void)draw:(CGContextRef)ctx
{
	// 设置线条颜色
	CGContextSetStrokeColorWithColor(ctx, self.currentColor.CGColor);
	// 设置填充颜色
	CGContextSetFillColorWithColor(ctx, self.currentColor.CGColor);
	// 设置线宽
	CGContextSetLineWidth(ctx, 2.0);
	CGContextSetShouldAntialias(ctx, YES);
	switch (self.shape) {
		CGFloat leftTopX , leftTopY;
		case kLineShape:
			// 添加从firstTouch到lastTouch的路径
			CGContextMoveToPoint(ctx, firstTouch.x, firstTouch.y);
			CGContextAddLineToPoint(ctx, lastTouch.x, lastTouch.y);
			// 绘制路径
			CGContextStrokePath(ctx);
			break;
		case kRectShape:
			// 填充矩形
			CGContextFillRect(ctx ,[self curRect]);
			break;
		case kEllipseShape:
			// 填充椭圆
			CGContextFillEllipseInRect(ctx ,[self curRect]);
			break;
		case kRoundRectShape:
			// 计算左上角的坐标
			leftTopX = firstTouch.x < lastTouch.x ? firstTouch.x :
				lastTouch.x;
			leftTopY = firstTouch.y < lastTouch.y ? firstTouch.y :
				lastTouch.y;
			// 添加圆角矩形的路径
			CGContextAddRoundRect(ctx ,leftTopX ,leftTopY ,
				fabs(lastTouch.x - firstTouch.x) ,
				fabs(lastTouch.y - firstTouch.y) , 16);
			// 填充路径
			CGContextFillPath(ctx);
			break;
		case kPenShape:
			// 添加从prevTouch到lastTouch的路径
			CGContextMoveToPoint(ctx, prevTouch.x, prevTouch.y);
			CGContextAddLineToPoint(ctx, lastTouch.x, lastTouch.y);
			// 绘制路径
			CGContextStrokePath(ctx);
			// 使用prevTouch保存当前点
			prevTouch = lastTouch;
			break;
	}
}
@end
