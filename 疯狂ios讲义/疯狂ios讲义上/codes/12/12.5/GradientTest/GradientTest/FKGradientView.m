//
//  FKGradientView.m
//  GradientTest
//
//  Created by yeeku on 13-7-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKGradientView.h"

@implementation FKGradientView
// 定义渐变对象
CGGradientRef gradient;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		self.opaque = YES;
		self.backgroundColor = [UIColor blackColor];
		// 设置每次清空上一次绘制的内容
		self.clearsContextBeforeDrawing = YES;
		// 创建RGB颜色空间
		CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
		// 定义渐变颜色：红、绿、蓝（可以根据需要增加或减少渐变颜色）
		CGFloat colors[] =
		{
			1 , 0 , 0 , 1,
			0 , 1 , 0 , 1,
			0 , 0 , 1 , 1,
		};
		// 创建渐变对象
		gradient = CGGradientCreateWithColorComponents(rgb, colors
			, NULL, sizeof(colors)/(sizeof(colors[0])*4));
		CGColorSpaceRelease(rgb);
    }
    return self;
}
// 当重新设置渐变类型时，通知该控件重绘自己
-(void)setType:(GradientType)newType
{
	if(_type != newType)
	{
		_type = newType;
		[self setNeedsDisplay];
	}
}
// 当重新设置是否扩展填充开始点之前的区域时，通知该控件重绘自己
-(void)setBeforeStart:(BOOL)yn
{
	if(_beforeStart != yn)
	{
		_beforeStart = yn;
		[self setNeedsDisplay];
	}
}
// 当重新设置是否扩展填充结束点之后的区域时，通知该控件重绘自己
-(void)setAfterEnd:(BOOL)yn
{
	if(_afterEnd != yn)
	{
		_afterEnd = yn;
		[self setNeedsDisplay];
	}
}
// 根据用户选择计算渐变选项
-(CGGradientDrawingOptions)drawingOptions
{
	CGGradientDrawingOptions options = 0;
	// 如果beforeStart为YES
	if(self.beforeStart)
	{
		// 使用kCGGradientDrawsBeforeStartLocation选项
		options |= kCGGradientDrawsBeforeStartLocation;
	}
	// 如果afterEnd为YES
	if(self.afterEnd)
	{
		// 使用kCGGradientDrawsAfterEndLocation选项
		options |= kCGGradientDrawsAfterEndLocation;
	}
	return options;
}
// 重写该方法绘制该控件
-(void)drawRect:(CGRect)rect
{
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	// 获取该组件四周各减少20px的区域
	CGRect clip = CGRectInset(CGContextGetClipBoundingBox(ctx), 20.0, 20.0);
	// 定义开始绘制的开始点和结束点
	CGPoint start, end;
	CGFloat startRadius, endRadius;
	// 创建一个Clip区域，用于控制只在clip区域内绘制
	CGContextClipToRect(ctx, clip);
	switch(self.type)
	{
		// 如果用户选择了线性渐变
		case kLinearGradient:
			// 以左上角（但Y坐标为clip内1/4处）作为线性渐变的起始点
			start = CGPointMake(clip.origin.x,
				clip.origin.y + clip.size.height * 0.25);
			// 以左上角（但Y坐标为clip内3/4处）作为线性渐变的结束始点
			end =  CGPointMake(clip.origin.x,
				clip.origin.y + clip.size.height * 0.75);
			// 填充线性渐变
			CGContextDrawLinearGradient(ctx, gradient
				, start, end, [self drawingOptions]);
			break;
		// 如果用户选择了圆形渐变
		case kRadialGradient:
			// 定义圆形渐变的开始圆心、结束圆心都是clip的中心
			start = end = CGPointMake(CGRectGetMidX(clip)
				, CGRectGetMidY(clip));
			// 计算clip区域的长、宽中较短的一条。
			CGFloat r = clip.size.width < clip.size.height
				? clip.size.width : clip.size.height;
			// 计算r的1/8作为起始圆的半径
			startRadius = r * 0.125;
			// 计算r的1/2作为起始圆的半径
			endRadius = r * 0.5;
			// 填充圆形渐变
			CGContextDrawRadialGradient(ctx, gradient, start
				, startRadius, end, endRadius, [self drawingOptions]);
			break;
	}
	// 绘制矩形边框
	CGContextSetRGBStrokeColor(ctx, 1, 1, 1, 1);
	CGContextStrokeRectWithWidth(ctx, clip, 2.0);
}
@end
