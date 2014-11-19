//
//  FKCellView.m
//  UICollectionViewControllerTest
//
//  Created by yeeku on 13-6-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FKCellView.h"

@implementation FKCellView

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		// 创建一个UIImageView控件
		UIImageView *imageView = [[UIImageView alloc] initWithImage:
			[UIImage imageNamed:@"java.png"]];
		imageView.frame = CGRectMake(0, 0, 154, 200);
		// 将UIImageView控件添加到该单元格中
		[self.contentView addSubview:imageView];
		// 创建一个UILabel控件
		self.label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0,
			frame.size.width, frame.size.height)];
		self.label.backgroundColor = [UIColor clearColor];
		// 设置该控件的自动缩放属性
		self.label.autoresizingMask = UIViewAutoresizingFlexibleHeight|
			UIViewAutoresizingFlexibleWidth;
		self.label.textAlignment = NSTextAlignmentCenter;
		self.label.font = [UIFont boldSystemFontOfSize:50.0];
		// 设置该控件文本颜色
		self.label.textColor = [UIColor redColor];
		// 将UILabel控件添加到该单元格中
		[self.contentView addSubview:self.label];
		// 设置边框
		self.contentView.layer.borderWidth = 2.0f;
		self.contentView.layer.borderColor = [UIColor redColor].CGColor;
		// 设置圆角
		self.layer.cornerRadius = 8.0;
		self.layer.masksToBounds = YES;
	}
	return self;
}
@end
