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
CGFloat currentRotation;
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
	currentRotation = 0;
	// 设置imageView允许用户交互，支持多点触碰
	self.imageView.userInteractionEnabled = YES;
	self.imageView.multipleTouchEnabled = YES;
	// 创建UIPinchGestureRecognizer手势处理器，该手势处理器激发scaleImage:方法
	UIPinchGestureRecognizer* gesture = [[UIPinchGestureRecognizer alloc]
		initWithTarget:self action:@selector(scaleImage:)];
	// 为imageView添加手势处理器
	[self.imageView addGestureRecognizer:gesture];
	// 创建UIRotationGestureRecognizer手势处理器，该手势处理器激发rotateImage:方法
	UIRotationGestureRecognizer* rotateGesture =
		[[UIRotationGestureRecognizer alloc]
		initWithTarget:self action:@selector(rotateImage:)];
	// 为imageView添加手势处理器
	[self.imageView addGestureRecognizer:rotateGesture];
}
- (void) scaleImage:(UIPinchGestureRecognizer*)gesture
{
	CGFloat scale = gesture.scale;
	// 根据手势处理器的缩放比计算图片缩放后的目标大小
	CGSize targetSize = CGSizeMake(srcImage.size.width * scale * currentScale,
		srcImage.size.height * scale * currentScale);
	// 对图片进行缩放、旋转
	self.imageView.image = [[srcImage imageByScalingToSize:targetSize]
		imageRotatedByRadians:currentRotation];
	// 如果手势结束
	if(gesture.state == UIGestureRecognizerStateEnded)
	{
		// 计算结束时候图片的缩放比
		currentScale = scale * currentScale;
	}
}
- (void) rotateImage:(UIRotationGestureRecognizer*)gesture
{
	// 获取手势旋转的弧度
	CGFloat rotation = gesture.rotation;
	// 根据当前缩放比计算图片缩放后的目标大小
	CGSize targetSize = CGSizeMake(srcImage.size.width * currentScale,
								   srcImage.size.height * currentScale);
	// 对图片进行缩放、旋转
	self.imageView.image = [[srcImage imageByScalingToSize:targetSize]
		imageRotatedByRadians:currentRotation + rotation];
	// 如果旋转手势结束
	if(gesture.state == UIGestureRecognizerStateEnded)
	{
		currentRotation = currentRotation + rotation;
	}
}
@end
