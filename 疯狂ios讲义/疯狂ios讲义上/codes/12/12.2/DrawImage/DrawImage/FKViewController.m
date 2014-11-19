//
//  FKViewController.m
//  DrawImage
//
//  Created by yeeku on 13-7-11.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	UIImageView* iv = [[UIImageView alloc]
		initWithImage: [self drawImage:self.view.frame.size]];
	[self.view addSubview:iv];
}
- (UIImage*) drawImage:(CGSize) size
{
	// 创建内存中的图片
	UIGraphicsBeginImageContext(size);
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	// 设置线宽
	CGContextSetLineWidth(ctx, 8);
	// ---------下面开始向内存中绘制图形---------
	// 设置线条颜色
	CGContextSetRGBStrokeColor(ctx, 0 , 1, 0 , 1);
	// 绘制一个矩形边框
	CGContextStrokeRect(ctx , CGRectMake(30 , 30 , 120 , 60));
	// 设置填充颜色
	CGContextSetRGBFillColor(ctx, 1, 1, 0 , 1);
	// 绘制一个矩形边框
	CGContextFillRect(ctx , CGRectMake(180 , 30 , 120 , 60));
	// 设置线条颜色
	CGContextSetRGBStrokeColor(ctx, 0, 1 , 1 , 1);
	// 绘制一个椭圆
	CGContextStrokeEllipseInRect(ctx , CGRectMake(30 , 120 , 120 , 60));
	// 设置填充颜色
	CGContextSetRGBFillColor(ctx, 1, 0 , 1 , 1);
	// 填充一个椭圆
	CGContextFillEllipseInRect(ctx , CGRectMake(180 , 120 , 120 , 60));
	// 获取该绘图Context中的图片
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	// ---------结束绘图---------
	UIGraphicsEndImageContext();
	// 获取当前应用路径下的Documents目录下的指定文件名对应的文件路径
	NSString *path = [[NSHomeDirectory()
		stringByAppendingPathComponent:@"Documents"]
		stringByAppendingPathComponent:@"newPng.png"];
	// 保存PNG图片
	[UIImagePNGRepresentation(newImage)
	 	writeToFile:path atomically:YES];
	return newImage;
}
@end
