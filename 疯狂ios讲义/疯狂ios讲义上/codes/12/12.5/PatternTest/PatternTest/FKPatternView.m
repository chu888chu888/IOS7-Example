//
//  FKPatternView.m
//  PatternTest
//
//  Created by yeeku on 13-7-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKPatternView.h"
#define CELL_SIZE 12
@implementation FKPatternView
// 定义代表模式填充的特殊颜色
CGColorRef coloredPatternColor;
CGColorRef imagePatternColor;
CGColorRef imagePatternColor2;
// ①、定义绘制填充“瓷砖块”的回调函数。
void ColoredPatternCallback(void *info, CGContextRef ctx)
{
	// 分别使用绿、红、蓝、紫绘制4个12*12的矩形，作为模式填充的瓷砖
	CGContextSetFillColorWithColor(ctx, [[UIColor greenColor] CGColor]);
	CGContextFillRect(ctx, CGRectMake(0 , 0, CELL_SIZE, CELL_SIZE));
	CGContextSetFillColorWithColor(ctx, [[UIColor redColor] CGColor]);
	CGContextFillRect(ctx, CGRectMake(0
		, CELL_SIZE, CELL_SIZE, CELL_SIZE));
	CGContextSetFillColorWithColor(ctx, [[UIColor blueColor] CGColor]);
	CGContextFillRect(ctx, CGRectMake(CELL_SIZE, 0, CELL_SIZE, CELL_SIZE));
	CGContextSetFillColorWithColor(ctx, [[UIColor purpleColor] CGColor]);
	CGContextFillRect(ctx, CGRectMake(CELL_SIZE
		, CELL_SIZE, CELL_SIZE, CELL_SIZE));
}
// 再定义绘制填充“瓷砖块”的回调函数。
void ImagedPatternCallback(void *info, CGContextRef ctx)
{
	CGContextDrawImage(ctx, CGRectMake(0, 0, 24, 24),
		[[UIImage imageNamed:@"heart.gif"] CGImage]);
	// 设置绘制边框的颜色
	CGContextSetRGBStrokeColor(ctx , 1 , 0 , 1 , 1);
	// 绘制矩形边框
	CGContextStrokeRectWithWidth(ctx,
		CGRectMake(0, 0, 24, 24), 2);
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
		CGPatternRef coloredPattern = CGPatternCreate(NULL
			, CGRectMake(0, 0, 24, 24) // 指定“瓷砖块”的大小
			, CGAffineTransformIdentity // 指定对“瓷砖块”执行变换的变换矩阵
			, 24, 24 // 指定平铺“瓷砖块”时横向、纵向上的间距
			, kCGPatternTilingNoDistortion
			, true // 指定绘制“瓷砖块”是否已指定了颜色
			, &coloredPatternCallbacks);
		// ④、创建用于模式填充的颜色空间。
		CGColorSpaceRef patternColorSpace = CGColorSpaceCreatePattern(NULL);
		CGFloat alpha = 1;
		// ⑤、创建一个代表模式填充的特殊颜色
		coloredPatternColor = CGColorCreateWithPattern(patternColorSpace
			, coloredPattern, &alpha);
		// -------------重复上面过程再次创建代表模式填充的特殊颜色--------------
		CGPatternCallbacks imagePatternCallbacks =
			{0, ImagedPatternCallback, NULL};
		CGPatternRef imagePattern = CGPatternCreate(NULL
			, CGRectMake(0, 0, 26, 26) // 指定“瓷砖块”的大小
			, CGAffineTransformIdentity // 指定对“瓷砖块”执行变换的变换矩阵
			, 30, 30 // 指定平铺“瓷砖块”时横向、纵向上的间距
					// 当该间距大于“瓷砖块”的大小时，“瓷砖”平铺之间有间距
			, kCGPatternTilingNoDistortion
			, true // 指定绘制“瓷砖块”是否已指定了颜色
			, &imagePatternCallbacks);
		imagePatternColor = CGColorCreateWithPattern(patternColorSpace
			, imagePattern, &alpha);
		// -------------重复上面过程再次创建代表模式填充的特殊颜色--------------
		CGPatternRef imagePattern2 = CGPatternCreate(NULL
			, CGRectMake(0, 0, 26, 26) // 指定“瓷砖块”的大小
			, CGAffineTransformMakeRotation(M_PI_4) // 指定对“瓷砖块”旋转45度
			, 30, 30 // 指定平铺“瓷砖块”时横向、纵向上的间距
			// 当该间距大于“瓷砖块”的大小时，“瓷砖”平铺之间有间距
			, kCGPatternTilingNoDistortion
			, true // 指定绘制“瓷砖块”是否已指定了颜色
			, &imagePatternCallbacks);
		imagePatternColor2 = CGColorCreateWithPattern(patternColorSpace
			, imagePattern2, &alpha);
	}
	return self;
}
// 重写该方法执行绘制
-(void)drawRect:(CGRect)rect
{
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	// 使用coloredPatternColor颜色（代表模式填充的颜色）填充
	CGContextSetFillColorWithColor(ctx, coloredPatternColor);
	CGContextFillRect(ctx, CGRectMake(10, 10, 130, 130));
	// 使用coloredPatternColor颜色（代表模式填充的颜色）绘制路径
	CGContextSetStrokeColorWithColor(ctx, coloredPatternColor);
	CGContextStrokeRectWithWidth(ctx, CGRectMake(160, 10, 130, 130) , 12);
	// --------再次使用代表模式填充的颜色来填充矩形和绘制矩形边框--------
	CGContextSetFillColorWithColor(ctx, imagePatternColor);
	CGContextFillRect(ctx, CGRectMake(10, 170, 130, 130));
	CGContextSetStrokeColorWithColor(ctx, imagePatternColor);
	CGContextStrokeRectWithWidth(ctx, CGRectMake(160, 170, 130, 130) , 12);
	// --------再次使用代表模式填充的颜色来填充矩形和绘制矩形边框--------
	CGContextSetFillColorWithColor(ctx, imagePatternColor2);
	CGContextFillRect(ctx, CGRectMake(10, 330, 130, 130));
	CGContextSetStrokeColorWithColor(ctx, imagePatternColor2);
	CGContextStrokeRectWithWidth(ctx, CGRectMake(160, 330, 130, 130) , 12);
}
@end
