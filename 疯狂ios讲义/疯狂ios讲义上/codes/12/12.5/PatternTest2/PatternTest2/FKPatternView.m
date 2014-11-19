//
//  FKPatternView.m
//  PatternTest2
//
//  Created by yeeku on 13-7-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKPatternView.h"
#define CELL_SIZE 12
@implementation FKPatternView
// 定义代表模式填充的特殊颜色
CGPatternRef pattern;
// ①、定义绘制填充“瓷砖块”的回调函数。
void ColoredPatternCallback(void *info, CGContextRef ctx)
{
	// 不使用颜色绘制2个12*12的矩形，作为模式填充的瓷砖
	CGContextFillRect(ctx, CGRectMake(0 , 0, CELL_SIZE, CELL_SIZE));
	CGContextFillRect(ctx, CGRectMake(CELL_SIZE
		, CELL_SIZE, CELL_SIZE, CELL_SIZE));
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if(self != nil)
	{
		// ②、创建CGPatternCallbacks结构体数据
		CGPatternCallbacks coloredPatternCallbacks =
		{0, ColoredPatternCallback, NULL};
		// ③、调用CGPatternCreate()函数创建CGPatternRef。
		pattern = CGPatternCreate(NULL
			, CGRectMake(0, 0, CELL_SIZE * 2, CELL_SIZE * 2) // 指定“瓷砖块”的大小
			, CGAffineTransformIdentity // 指定对“瓷砖块”执行变换的变换矩阵
			, CELL_SIZE * 2, CELL_SIZE * 2 // 指定平铺“瓷砖块”时横向、纵向上的间距
			, kCGPatternTilingNoDistortion
			, false // 指定绘制“瓷砖块”是否已指定了颜色
			, &coloredPatternCallbacks);
	}
	return self;
}
// 重写该方法执行绘制
-(void)drawRect:(CGRect)rect
{
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	// 创建设备无关的代表RGB模式的颜色空间
	CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
	// 创建代表模式填充的颜色空间
	CGColorSpaceRef patternColorSpace = CGColorSpaceCreatePattern(
		rgbColorSpace);
	// 定义RGB模式的红色
	CGFloat redColor[] = {1, 0 , 0 , 1};
	// ④、将填充颜色的颜色空间设为模式填充的颜色空间
	CGContextSetFillColorSpace(ctx, patternColorSpace);
	// ⑤、设置使用指定模式执行填充、并为“瓷砖块“中的绘制指定颜色。
	CGContextSetFillPattern(ctx, pattern, redColor);
	CGContextFillRect(ctx, CGRectMake(10, 10, 130, 130));
	// 将绘制颜色的颜色空间设为模式填充的颜色空间
	CGContextSetStrokeColorSpace(ctx, patternColorSpace);
	// 设置使用模式填充、并为“瓷砖块“中的绘制指定颜色。
	CGContextSetStrokePattern(ctx, pattern, redColor);
	CGContextStrokeRectWithWidth(ctx , CGRectMake(160, 10, 130, 130) , 10);
	// 定义RGB模式的绿色
	CGFloat greenColor[] = {0, 1 , 0 , 1};
	// 设置使用模式填充、并为“瓷砖块“中的绘制指定颜色。
	CGContextSetFillPattern(ctx, pattern, greenColor);
	CGContextFillRect(ctx, CGRectMake(10, 170, 130, 130));
	// 设置使用模式填充、并为“瓷砖块“中的绘制指定颜色。
	CGContextSetStrokePattern(ctx, pattern, greenColor);
	CGContextStrokeRectWithWidth(ctx , CGRectMake(160, 170, 130, 130) , 10);
}
@end