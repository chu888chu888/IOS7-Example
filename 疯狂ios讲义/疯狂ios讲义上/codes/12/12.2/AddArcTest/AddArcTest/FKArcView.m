//
//  FKArcView.m
//  AddArcTest
//
//  Created by yeeku on 13-7-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKArcView.h"

@implementation FKArcView

- (void)drawRect:(CGRect)rect
{
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	for(int i = 0 ; i < 10 ; i++)
	{
		// 开始定义路径
		CGContextBeginPath(ctx);
		// 添加一段圆弧，最后一个参数1代表逆时针，0代表顺时针
		CGContextAddArc(ctx , i * 25 , i * 25
			, (i + 1) * 8 , M_PI * 1.5 , M_PI , 0);
		// 关闭路径
		CGContextClosePath(ctx);
		// 设置填充颜色
		CGContextSetRGBFillColor(ctx, 1, 0, 1, (10 - i) * 0.1);
		// 填充当前路径。
		CGContextFillPath(ctx);
	}
}
@end
