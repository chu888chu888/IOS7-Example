//
//  FKViewController.m
//  GGImageTest
//
//  Created by yeeku on 13-7-7.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "UIImage+FKCategory.h"

@implementation FKViewController
UIImage* rawImage;
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor grayColor];
	// 获取原始的UIImage对象
	rawImage = [UIImage imageNamed:@"fish.png"];
	// 获取图片旋转后30度后得到的新图片
	UIImageView* iv1 = [[UIImageView alloc] initWithImage:
		[rawImage imageRotatedByDegrees:30]];
	[self.view addSubview:iv1];
	// 获取图片不保持纵横比缩放到130*130后的效果
	UIImageView* iv2 = [[UIImageView alloc] initWithImage:
		[rawImage imageByScalingToSize:CGSizeMake(130 , 130)]];
	iv2.center = CGPointMake(220 , 80);
	[self.view addSubview:iv2];
	// 获取图片保持纵横比，最长边不超过180
	UIImageView* iv3 = [[UIImageView alloc] initWithImage:
		[rawImage imageByScalingAspectToMaxSize:CGSizeMake(180 , 180)]];
	iv3.center = CGPointMake(100 , 210);
	[self.view addSubview:iv3];
	// 挖取图片指定区域的一块
	UIImageView* iv4 = [[UIImageView alloc] initWithImage:
		[rawImage imageAtRect:CGRectMake(40, 20, 60, 40)]];
	iv4.center = CGPointMake(240 , 210);
	[self.view addSubview:iv4];
	// 获取图片保持纵横比，最短边至少180，长边将会被截断
	UIImageView* iv5 = [[UIImageView alloc] initWithImage:
		[rawImage imageByScalingAspectToMinSize:CGSizeMake(180 , 180)]];
	iv5.center = CGPointMake(150 , 360);
	[self.view addSubview:iv5];
}
@end
