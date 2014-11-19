//
//  FKBlendView.m
//  BlendTest
//
//  Created by yeeku on 13-7-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKBlendView.h"

@implementation FKBlendView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
	{
		// 设置初始的叠加颜色、叠加模式
		_sourceColor = [UIColor whiteColor];
		_destinationColor = [UIColor blackColor];
		_blendMode = kCGBlendModeNormal;
    }
    return self;
}
// 当重新设置叠加的源颜色时，通知该控件重绘自己
-(void)setSourceColor:(UIColor*)src
{
	if(_sourceColor != src)
	{
		_sourceColor = src;
		[self setNeedsDisplay];
	}
}
// 当重新设置叠加的目标颜色时，通知该控件重绘自己
-(void)setDestinationColor:(UIColor*)dest
{
	if(_destinationColor != dest)
	{
		_destinationColor = dest;
		[self setNeedsDisplay];
	}
}
// 当重新设置叠加模式时，通知该控件重绘自己
-(void)setBlendMode:(CGBlendMode)mode
{
	if(_blendMode != mode)
	{
		_blendMode = mode;
		[self setNeedsDisplay];
	}
}
// 重写该方法，重绘该控件
- (void)drawRect:(CGRect)rect
{
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	// 设置填充颜色
	CGContextSetGrayFillColor(ctx, 0.2, 1.0);
	// 填充该控件的背景
	CGContextFillRect(ctx, self.bounds);
	// 使用kCGBlendModeCopy混合模式，表示直接将该颜色绘制在背景上，不使用任何混合模式。
	CGContextSetBlendMode(ctx, kCGBlendModeCopy);
	// 用叠加的目标颜色绘制矩形区域
	CGContextSetFillColorWithColor(ctx, self.destinationColor.CGColor);
	CGContextFillRect(ctx, CGRectMake(110.0, 20.0, 100.0, 100.0));
	// 设置用户选择的叠加模式
	CGContextSetBlendMode(ctx, self.blendMode);
	// 用叠加的源颜色绘制矩形区域
	CGContextSetFillColorWithColor(ctx, self.sourceColor.CGColor);
	CGContextFillRect(ctx, CGRectMake(60.0, 45.0, 200.0, 50.0));
}
@end
