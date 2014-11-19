//
//  FKCustomAlertView.m
//  CustomAlertView
//
//  Created by yeeku on 13-6-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKCustomAlertView.h"

@implementation FKCustomAlertView

- (void) layoutSubviews {
	// 重新定义该控件的大小
	[self setFrame:CGRectMake(self.frame.origin.x,
		self.frame.origin.y - self.extHeight / 2,
		self.frame.size.width,
		self.frame.size.height + self.extHeight)];
	int lowestIndex = 0;
	// 找到UIAlertView控件包含的所有控件的最大索引
	while (![[self.subviews objectAtIndex:lowestIndex]
			isKindOfClass:[UIControl class]])
	{
		lowestIndex++;
	}
	// 将items数组中包含的控件添加到UIAlertView控件中
	for(int i = 0 ; i < self.items.count ; i++)
	{
		[self insertSubview:[self.items objectAtIndex:i]
			atIndex:lowestIndex - 1];
	}
	// 将所有原来的所有控件下移
	for (UIView *v in self.subviews) {
		if ([v isKindOfClass:[UIControl class]])
		{
			v.frame = CGRectMake(v.frame.origin.x,
				v.frame.origin.y + self.extHeight - 8,
				v.frame.size.width,
				v.frame.size.height);
		}
	}
	[super layoutSubviews];
}
@end
