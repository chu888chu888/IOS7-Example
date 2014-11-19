//
//  FKViewController.m
//  UIImageViewTest
//
//  Created by yeeku on 13-6-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
NSArray* images;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建一个NSArray集合，其中集合元素都是UIImage对象
	images = [NSArray arrayWithObjects:
		[UIImage imageNamed:@"lijiang.jpg"],
		[UIImage imageNamed:@"qiao.jpg"],
		[UIImage imageNamed:@"xiangbi.jpg"],
		[UIImage imageNamed:@"shui.jpg"],
		[UIImage imageNamed:@"shuangta.jpg"], nil];
	// 设置iv控件需要动画显示的图片为images集合元素
	self.iv.animationImages = images;
	// 设置动画持续时间
	self.iv.animationDuration = 12;
	// 设置动画重复次数
	self.iv.animationRepeatCount = 999999;
	// 让iv控件开始播放动画
	[self.iv startAnimating];
}
- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}
@end
