//
//  FKMyView.m
//  Gradienter
//
//  Created by yeeku on 13-10-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKMyView.h"

@implementation FKMyView
- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		_bubble = [UIImage imageNamed:@"bubble.png"];
		// 初始化时设置气泡的位置位于水平仪中心
		_bubbleX = (self.bounds.size.width - _bubble.size.width) / 2;
		_bubbleY = (self.bounds.size.height - _bubble.size.height) / 2;
	}
	return self;
}
- (void)drawRect:(CGRect)rect
{
	// 绘制气泡
	[self.bubble drawAtPoint:CGPointMake(self.bubbleX, self.bubbleY)];
}
@end
