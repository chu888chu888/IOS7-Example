//
//  FKViewController.m
//  UIProgressViewTest
//
//  Created by yeeku on 13-6-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
// 定义一个定时器
NSTimer *timer;
// 定义一个变量，记录当前的进度值
CGFloat progVal;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建可拉伸图片，指定对no.gif图片整体进行平铺
	UIImage* trackImage = [[UIImage imageNamed:@"no.gif"]
		resizableImageWithCapInsets:UIEdgeInsetsZero
		resizingMode:UIImageResizingModeTile];
	// 创建可拉伸图片，指定对ok.gif图片整体进行平铺	
	UIImage* progressImage = [[UIImage imageNamed:@"ok.gif"]
		resizableImageWithCapInsets:UIEdgeInsetsZero
		resizingMode:UIImageResizingModeTile];
	// 自定义第3个进度条的外观
	self.prog3.trackImage = trackImage;
	self.prog3.progressImage = progressImage;
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

- (IBAction)clicked:(id)sender {
	progVal = 0;
	// 启动计时器，控制每隔0.2秒调用一次changeProgress方法
	timer = [NSTimer scheduledTimerWithTimeInterval:0.2
		target:self selector:@selector(changeProgress)
		userInfo:nil repeats:YES];
}
-(void)changeProgress
{
	// 进度值增加0.01
	progVal += 0.01;
	if(progVal >= 1.0)
	{
		// 停用计时器
		[timer invalidate];
	}
	else
	{
		// 同时改变3个进度条的进度值
		[self.prog1 setProgress:progVal animated:YES];
		[self.prog2 setProgress:progVal animated:YES];
		[self.prog3 setProgress:progVal animated:YES];
	}
}
@end
