//
//  FKSnowView.m
//  Snow
//
//  Created by yeeku on 13-7-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKSnowView.h"
#import "FKContext.h"

@implementation FKSnowView
// 定义雪花的初始化位置
static CGPoint snowPos[] = {
	{20, 4},
	{50, 4},
	{80, 4},
	{110, 4},
	{140, 4},
	{170, 4},
	{200, 4},
	{230, 4},
	{260, 4},
	{290, 4}
};
// 计算雪花的数量
static NSInteger snowCount = sizeof(snowPos)
	/ sizeof(snowPos[0]);
-(id) initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if(self)
	{
		// 控制每隔0.2秒执行一次setNeedsDisplay方法刷新自己
		[NSTimer scheduledTimerWithTimeInterval:0.2 target:self
			selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
	}
	return self;
}
- (void)drawRect:(CGRect)rect
{
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	// 设置采用白色作为填充色
	CGContextSetRGBFillColor(ctx , 1, 1 , 1 , 1);
	for (int i = 0 ; i < snowCount ; i++ )
	{
		// 保存当前绘图状态
		CGContextSaveGState(ctx);
		// 平移坐标系统
		CGContextTranslateCTM(ctx , snowPos[i].x , snowPos[i].y);
		// 旋转坐标系统
		CGContextRotateCTM(ctx , (arc4random() % 6 - 3) * M_PI / 10);
		// 控制“雪花”下掉
		snowPos[i].y += arc4random() % 8;
		if (snowPos[i].y > 320)
		{
			snowPos[i].y = 4;
		}
		// 创建、并绘制“雪花”
		CGContextAddFlower(ctx , 6 , 0 , 0 , 4 , 8);
		CGContextFillPath(ctx);
		// 恢复绘图状态
		CGContextRestoreGState(ctx);
	}
}
@end
