//
//  FKViewController.m
//  PinchImage
//
//  Created by yeeku on 13-7-19.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "UIImage+FKCategory.h"
@interface FKViewController ()

@end

@implementation FKViewController
UIImage* srcImage;
CGFloat currentScale;
- (void)viewDidLoad
{
	[super viewDidLoad];
	[UIApplication sharedApplication].statusBarHidden = YES;
	srcImage = [UIImage imageNamed:@"seashore.png"];
	// 设置图片直接显示在中间（不进行任何缩放）
	self.view.contentMode = UIViewContentModeCenter;
	// 设置imageView初始显示的图片
	self.imageView.image = srcImage;
	// 设置初始的缩放比例
	currentScale = 1;
	// 设置imageView允许用户交互，支持多点触碰
	self.imageView.userInteractionEnabled = YES;
	self.imageView.multipleTouchEnabled = YES;
	// 创建UIPinchGestureRecognizer手势处理器，该手势处理器激发scaleImage方法
	UIPinchGestureRecognizer* gesture = [[UIPinchGestureRecognizer alloc]
		initWithTarget:self action:@selector(scaleImage:)];
	// 为imageView添加手势处理器
	[self.imageView addGestureRecognizer:gesture];
}
- (void) scaleImage:(UIPinchGestureRecognizer*)gesture
{
	CGFloat scale = gesture.scale;
	// 如果捏合手势刚刚开始
	if (gesture.state == UIGestureRecognizerStateBegan)
	{
		// 计算当前缩放比
		currentScale = self.imageView.image.size.width / srcImage.size.width;
	}
	// 根据手势处理的缩放比计算图片缩放后的目标大小
	CGSize targetSize = CGSizeMake(srcImage.size.width * scale * currentScale,
		srcImage.size.height * scale * currentScale);
	// 对图片进行缩放
	self.imageView.image = [srcImage imageByScalingToSize:targetSize];
}
@end
