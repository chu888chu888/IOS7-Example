//
//  FKViewController.m
//  CALayerTest
//
//  Created by yeeku on 13-7-28.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//


#import "FKViewController.h"
#import "FKContext.h"

@implementation FKViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor grayColor];
	//--------------为UIView设置圆角边框--------------	
	// 设置该视图控制器所显示的UIView上的CALayer的圆角半径
	self.view.layer.cornerRadius = 8;
	// 设置该视图控制器所显示的UIView上的CALayer的边框宽度
	self.view.layer.borderWidth = 4;
	// 设置该视图控制器所显示的UIView上的CALayer的边框颜色
	self.view.layer.borderColor = [UIColor redColor].CGColor;
	//--------------创建简单的CALayer--------------		
	// 创建一个CALayer对象
	CALayer *subLayer = [CALayer layer];
	// 设置subLayer的背景颜色
	subLayer.backgroundColor = [UIColor magentaColor].CGColor;
	// 设置subLayer的圆角半径	
	subLayer.cornerRadius = 8;
	// 设置subLayer的边框宽度	
	subLayer.borderWidth = 2;
	// 设置subLayer的背景色	
	subLayer.borderColor = [UIColor blackColor].CGColor;
	// 设置subLayer的阴影偏移（此处向右下角投下阴影）
	subLayer.shadowOffset = CGSizeMake(4, 5);
	// 设置subLayer的阴影的模糊程度（该属性值越大，阴影越模糊）
	subLayer.shadowRadius = 1;
	// 设置subLayer的阴影的颜色	
	subLayer.shadowColor = [UIColor blackColor].CGColor;
	// 设置subLayer的阴影的透明度
	subLayer.shadowOpacity = 0.8;
	// 设置subLayer的大小和位置
	subLayer.frame = CGRectMake(30, 30, 120, 160);
	// 将subLayer添加到该视图控制器所显示的UIView上的CALayer
	[self.view.layer addSublayer:subLayer];
	// 再创建一个CALayer对象
	CALayer *subLayer2 = [CALayer layer];
	// 设置该CALayer的边框、阴影、大小、位置等属性
	subLayer2.cornerRadius = 8;
	subLayer2.borderWidth = 2;
	subLayer2.borderColor = [UIColor blackColor].CGColor;
	subLayer2.shadowOffset = CGSizeMake(4, 5);
	subLayer2.shadowRadius = 1;
	subLayer2.shadowColor = [UIColor blackColor].CGColor;
	subLayer2.shadowOpacity = 0.8;
	subLayer2.masksToBounds = YES;
	subLayer2.frame = CGRectMake(170, 30, 120, 160);
	// 将subLayer2添加到该视图控制器所显示的UIView上的CALayer
	[self.view.layer addSublayer:subLayer2];
	//-------------使用CALayer显示图片--------------
	// 再创建一个CALayer对象
	CALayer *imageLayer = [CALayer layer];
	// 设置该imageLayer显示的图片
	imageLayer.contents = (id)[[UIImage imageNamed:@"android"] CGImage];
	// 设置iamgeLayer的大小和位置。
	imageLayer.frame = subLayer2.bounds;
	// 将imageLayer添加到subLayer2中
	[subLayer2 addSublayer:imageLayer];
	//--------------自定义CALayer的绘制内容--------------
	// 再创建一个CALayer对象
	CALayer *customDrawn = [CALayer layer];
	// 设置CALayer的委托对象，该委托对象负责该CALayer的绘制
	customDrawn.delegate = self;
	customDrawn.backgroundColor = [UIColor greenColor].CGColor;
	customDrawn.frame = CGRectMake(30, 220, 260, 210);
	customDrawn.shadowOffset = CGSizeMake(0, 3);
	customDrawn.shadowRadius = 5.0;
	customDrawn.shadowColor = [UIColor blackColor].CGColor;
	customDrawn.shadowOpacity = 0.8;
	customDrawn.cornerRadius = 10.0;
	customDrawn.borderColor = [UIColor blackColor].CGColor;
	customDrawn.borderWidth = 2.0;
	customDrawn.masksToBounds = YES;
	[self.view.layer addSublayer:customDrawn];
	// 必须有这行，这行才会通知CALayer调用delegate的drawLayer方法
	[customDrawn setNeedsDisplay];
	[super viewDidLoad];
}
// 重写该方法为CALayer绘制自定义内容
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)context {
	UIColor* bgColor = [UIColor colorWithPatternImage:
			   [UIImage imageNamed:@"heart.gif"]];
	// 设置绘图的背景色
	CGContextSetFillColorWithColor(context, bgColor.CGColor);
	// 填充一个椭圆
	CGContextFillEllipseInRect(context, CGRectMake(20 , 20 , 100 , 100));
	CGContextAddRoundRect(context, 160, 20, 100, 60, 5);
	CGContextFillPath(context);
	CGContextSetRGBStrokeColor(context, 1, 1, 0, 1);
	CGContextStrokePath(context);
	CGContextAddStar(context, 5, 140, 150, 60);
	CGContextSetRGBFillColor(context, .5, 1, 1, 1);
	CGContextFillPath(context);
}
@end
