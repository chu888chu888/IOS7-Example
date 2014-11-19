//
//  FKShadowView.m
//  ShadowTest
//
//  Created by yeeku on 13-7-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKShadowView.h"

@implementation FKShadowView

- (void)drawRect:(CGRect)rect
{
	// 获取绘图的CGContextRef
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	// 使用默认的阴影颜色，阴影向左上角投影，模糊度为5
	CGContextSetShadow(ctx, CGSizeMake(8, -6), 5);
	// 设置填充颜色
	CGContextSetRGBFillColor (ctx, 1, 0, 1, 1);
	// 设置线条颜色
	CGContextSetRGBStrokeColor (ctx, 0, 0, 1, 1);
	// 设置使用填充模式绘制文字
	CGContextSetTextDrawingMode (ctx, kCGTextFill);
	// 绘制文字
	[@"疯狂iOS讲义" drawAtPoint:CGPointMake(10 ,20)
	 	withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
	 	[UIFont fontWithName:@"Arial Rounded MT Bold" size: 45]
	 	, NSFontAttributeName ,
		 [UIColor magentaColor] , NSForegroundColorAttributeName, nil]];
	// 设置使用描边模式绘制文字
	CGContextSetTextDrawingMode (ctx, kCGTextStroke);
	// 绘制文字
	[@"疯狂Android讲义" drawAtPoint:CGPointMake(10 ,80)
		withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
		[UIFont fontWithName:@"Heiti SC" size: 40], NSFontAttributeName ,
		[UIColor magentaColor] , NSForegroundColorAttributeName, nil]];
	// 使用默认的阴影颜色，阴影向右下角投影，模糊度为20
	CGContextSetShadowWithColor(ctx, CGSizeMake(10, 8), 10
		, [[UIColor redColor] CGColor]);
	CGContextFillRect(ctx, CGRectMake(20 , 150 , 180 , 80));
	// 设置线条颜色
	CGContextSetRGBStrokeColor (ctx, 1, 0, 1, 1);
	CGContextStrokeRect(ctx, CGRectMake(30 , 260 , 180 , 80));
}
@end
