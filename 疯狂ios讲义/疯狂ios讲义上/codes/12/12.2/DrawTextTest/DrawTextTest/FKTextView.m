//
//  FKTextView.m
//  DrawTextTest
//
//  Created by yeeku on 13-7-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKTextView.h"

@implementation FKTextView
- (void)setScaleRate:(CGFloat)scaleRate
{
	if(_scaleRate != scaleRate)
	{
		_scaleRate = scaleRate;
		// 通知该控件重绘自己
		[self setNeedsDisplay];
	}
}
- (void)setRotateAngle:(CGFloat)rotateAngle
{
	if(_rotateAngle != rotateAngle)
	{
		_rotateAngle = rotateAngle;
		// 通知该控件重绘自己
		[self setNeedsDisplay];
	}
}
// 重写该方法绘制该控件
- (void)drawRect:(CGRect)rect
{
	// 获取该控件的绘图CGContextRef
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	// 设置字符间距
	CGContextSetCharacterSpacing (ctx, 4);
	// 设置填充颜色
	CGContextSetRGBFillColor (ctx, 1, 0, 1, 1);
	// 设置线条颜色
	CGContextSetRGBStrokeColor (ctx, 0, 0, 1, 1);
	// 设置使用填充模式绘制文字
	CGContextSetTextDrawingMode (ctx, kCGTextFill);
	// 绘制文字	
	[@"疯狂iOS讲义" drawAtPoint:CGPointMake(10 ,20)
		withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
	 	[UIFont fontWithName:@"Arial Rounded MT Bold" size: 45],
		NSFontAttributeName,
		[UIColor magentaColor] , NSForegroundColorAttributeName , nil]];
	// 设置使用描边模式绘制文字
	CGContextSetTextDrawingMode (ctx, kCGTextStroke);
	// 绘制文字
	[@"疯狂Android讲义" drawAtPoint:CGPointMake(10 ,80)
		withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
		[UIFont fontWithName:@"Heiti SC" size: 40],NSFontAttributeName,
		[UIColor blueColor] , NSForegroundColorAttributeName , nil]];
	// 设置使用填充、描边模式绘制文字
	CGContextSetTextDrawingMode (ctx, kCGTextFillStroke);
	// 绘制文字
	[@"疯狂Ajax讲义" drawAtPoint:CGPointMake(10 ,130)
		withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
		[UIFont fontWithName:@"Heiti SC" size: 50], NSFontAttributeName,
		[UIColor magentaColor] , NSForegroundColorAttributeName , nil]];
	// 定义一个垂直镜像的变换矩阵
	CGAffineTransform yRevert = CGAffineTransformMake(1, 0, 0, -1, 0, 0);
	// 设置绘制文本的字体和字体大小
	CGContextSelectFont (ctx, "Courier New" , 40
		,kCGEncodingMacRoman);
	// 为yRevert变换矩阵根据scaleRate添加缩放变换矩阵
	CGAffineTransform scale = CGAffineTransformScale(yRevert,
		self.scaleRate, self.scaleRate);
	// 为scale变换矩阵根据rotateAngle添加旋转变换矩阵	
	CGAffineTransform rotate = CGAffineTransformRotate(scale
		, M_PI * self.rotateAngle / 180);
	// 对CGContextRef绘制文字时应用变换
	CGContextSetTextMatrix(ctx, rotate);
	// 绘制文本
	CGContextShowTextAtPoint(ctx, 50, 300, "crazyit.org", 11);
}
@end
