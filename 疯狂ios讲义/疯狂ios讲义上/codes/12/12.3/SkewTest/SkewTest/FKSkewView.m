//
//  FKSkewView.m
//  SkewTest
//
//  Created by yeeku on 13-7-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKSkewView.h"

void CGContextSkewCTM(CGContextRef ctx, CGFloat angle)
{
	CGAffineTransform transform = CGAffineTransformMake(
		1 , 0 , -tanf(angle) , 1 , 0 , 0);
	CGContextConcatCTM(ctx, transform);
}
@implementation FKSkewView
- (void)drawRect:(CGRect)rect
{
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSetRGBFillColor(ctx, 1, 0, 0, 0.3);
	// 坐标系统平移到-40、200点
	CGContextTranslateCTM(ctx, 120, 5);
	for(int i = 0 ; i < 20 ; i++)
	{
		// 平移坐标系统
		CGContextTranslateCTM(ctx, 50, 30);
		// 缩放坐标系统
		CGContextScaleCTM(ctx, 0.9 , 0.9);
		// 倾斜变换
		CGContextSkewCTM(ctx , M_PI / 10);
		// 填充矩形
		CGContextFillRect(ctx , CGRectMake(0 , 0 , 120 , 60));
	}
}
@end
