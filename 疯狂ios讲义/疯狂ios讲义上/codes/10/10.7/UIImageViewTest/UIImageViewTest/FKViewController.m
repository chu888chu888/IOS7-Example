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
int curImage;
CGFloat alpha;
- (void)viewDidLoad
{
	[super viewDidLoad];
	curImage = 0;
	alpha = 1.0;
	images = [NSArray arrayWithObjects:@"lijiang.jpg",
		@"qiao.jpg", @"xiangbi.jpg"
		, @"shui.jpg" , @"shuangta.jpg" , nil];
	// 创建一个轻击的手势检测器
	UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]
		initWithTarget:self action:@selector(clicked:)];
	// 启用iv控件的用户交互，从而允许该控件能响应用户手势
	self.iv.userInteractionEnabled = YES;
	// 为UIImageView添加手势检测器
	[self.iv addGestureRecognizer:singleTap];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

- (IBAction)plus:(id)sender {
	alpha += 0.02;
	// 如果透明度已经大于或等于1.0，将透明度设置为1.0
	if(alpha >= 1.0)
	{
		alpha = 1.0;
	}
	// 设置iv控件的透明度。
	self.iv.alpha = alpha;	
}

- (IBAction)minus:(id)sender {
	alpha -= 0.02;
	// 如果透明度已经小于或等于0.0，将透明度设置为0.0
	if(alpha <= 0.0)
	{
		alpha = 0.0;
	}
	// 设置iv控件的透明度。
	self.iv.alpha = alpha;
}

- (IBAction)next:(id)sender {
	// 控制iv的image显示images数组中的下一张图片
	self.iv.image = [UIImage imageNamed:
		[images objectAtIndex:(++curImage % images.count)]];
}

- (void) clicked:(UIGestureRecognizer *)gestureRecognizer
{
	// 获取正在显示的原始位图
	UIImage* srcImage = self.iv.image;
	// 获取用户手指在iv控件上的触碰点
	CGPoint pt = [gestureRecognizer locationInView: self.iv];
	// 获取正在显示的原图对应的CGImageRef
	CGImageRef sourceImageRef = [srcImage CGImage];
	// 获取图片实际大小与第一个UIImageView的缩放比例
	CGFloat scale = srcImage.size.width / 320;
	// 将iv控件上触碰点的左边换算成原始图片上的位置
	CGFloat x = pt.x * scale;
	CGFloat y = pt.y * scale;
	if(x + 120 > srcImage.size.width)
	{
		x = srcImage.size.width - 140;
	}
	if(y + 120 > srcImage.size.height)
	{
		y = srcImage.size.height - 140;
	}
	// 调用CGImageCreateWithImageInRect函数获取sourceImageRef中
	// 指定区域的图片
	CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef
		, CGRectMake(x, y, 140, 140));
	// 让iv2控件显示newImageRef对应的图片
	self.iv2.image = [UIImage imageWithCGImage:newImageRef];
}
@end
