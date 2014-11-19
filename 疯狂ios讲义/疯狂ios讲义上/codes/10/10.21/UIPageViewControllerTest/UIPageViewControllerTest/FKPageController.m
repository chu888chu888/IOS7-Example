//
//  FKPageController.m
//  UIPageControlTest
//
//  Created by yeeku on 13-6-30.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKPageController.h"

@interface FKPageController ()

@end

@implementation FKPageController
NSArray * contentList;
NSArray * coverList;
- (id)initWithPageNumber:(NSInteger)pageNumber
{
	contentList = [NSArray arrayWithObjects:@"疯狂Android讲义",
		@"疯狂Ajax讲义",
		@"疯狂XML讲义",
		@"疯狂HTML5/CSS3/JavaScript讲义" , nil];
	coverList = [NSArray arrayWithObjects:@"android.png",
		@"ajax.png",
		@"xml.png",
		@"html.png" , nil];
	self.pageIndex = pageNumber;
	self = [super initWithNibName:nil bundle:nil];
	if (self)
	{
		// 设置背景
		self.view.backgroundColor = [UIColor grayColor];
		// 创建UILabel控件
		UILabel* label = [[UILabel alloc] initWithFrame:
			CGRectMake(260 , 10 , 60 , 35)];
		label.backgroundColor = [UIColor clearColor];
		label.textColor = [UIColor redColor];
		// 设置UILabel控件显示的文本
		label.text = [NSString stringWithFormat:@"第[%d]页"
			, pageNumber + 1];
		// 将UILabel添加到程序界面中
		[self.view addSubview:label];
		// 创建UILabel控件
		UILabel* bookLabel = [[UILabel alloc] initWithFrame:
			CGRectMake(0 , 30,
			CGRectGetWidth(self.view.frame) , 60)];
		bookLabel.textAlignment = NSTextAlignmentCenter;
		bookLabel.numberOfLines = 2;
		bookLabel.font = [UIFont systemFontOfSize:24];
		bookLabel.backgroundColor = [UIColor clearColor];
		bookLabel.textColor = [UIColor blueColor];
		// 设置UILabel控件显示的文本
		bookLabel.text = [contentList objectAtIndex:pageNumber % 4];
		// 将UILabel添加到程序界面中
		[self.view addSubview:bookLabel];
		// 创建UIImageView控件
		UIImageView* bookImage = [[UIImageView alloc] initWithFrame:
			CGRectMake(0, 90, CGRectGetWidth(self.view.frame), 320)];
		// 设置该控件的图片缩放模式
		bookImage.contentMode = UIViewContentModeScaleAspectFit;
		// 设置该UIImageView所显示的图片
		bookImage.image = [UIImage imageNamed:[
			coverList objectAtIndex:pageNumber % 4]];
		// 将UIImageView添加到程序界面中
		[self.view addSubview:bookImage];
	}
	return self;
}
@end
