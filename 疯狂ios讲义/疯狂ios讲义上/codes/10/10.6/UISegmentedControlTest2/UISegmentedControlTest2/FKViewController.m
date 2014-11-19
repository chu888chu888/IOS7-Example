//
//  FKViewController.m
//  UISegmentedControlTest2
//
//  Created by yeeku on 13-6-7.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

- (IBAction)add:(id)sender {
	NSUInteger count = self.segment.numberOfSegments;
	// 获取该文本框内输入的字符串
	NSString* title = self.tv.text;
	// 如果用户输入的字符串长度大于0
	if([title length] > 0)
	{
		// 以用户输入的内容插入一个分段
		[self.segment insertSegmentWithTitle:title
			atIndex:count animated:YES];
		// 清空文本框内容
		self.tv.text = @"";
	}
}
- (IBAction)remove:(id)sender {
	NSUInteger count = self.segment.numberOfSegments;
	// 删除UISegmentedControl控件最后一个分段
	[self.segment removeSegmentAtIndex: count-1
		animated:YES];
}
@end
