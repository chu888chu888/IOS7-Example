//
//  FKTransformView.m
//  TransformTest
//
//  Created by yeeku on 13-7-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKTransformView.h"

@implementation FKTransformView

- (void)drawRect:(CGRect)rect
{
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	// 设置使用半透明的填充颜色
	CGContextSetRGBFillColor(ctx, 1, 0, 0, 0.3);
	// 坐标系统平移到-40、200点
	CGContextTranslateCTM(ctx, -40, 200);
	for(int i = 0 ; i < 50 ; i++)
	{
		CGContextTranslateCTM(ctx, 50, 50);
		CGContextScaleCTM(ctx, 0.93, 0.93);
		CGContextRotateCTM(ctx, -M_PI / 10);
		CGContextFillRect(ctx, CGRectMake(0 , 0 , 150 , 75));
	}
}
@end
