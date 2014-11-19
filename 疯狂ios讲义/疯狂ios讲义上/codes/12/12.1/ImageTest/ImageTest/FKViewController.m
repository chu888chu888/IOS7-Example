//
//  FKViewController.m
//  ImageTest
//
//  Created by yeeku on 13-7-7.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
// 定义显示图片的UIImageView控件
UIImageView* iv;
// 定义定时器
NSTimer* timer;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 设置背景色为白色
	self.view.backgroundColor = [UIColor whiteColor];
	// 创建UIImageView控件
	iv = [[UIImageView alloc]
		  initWithFrame:CGRectMake(0 , 30 , 41 , 43)];
	// 使用UIImageView加载文件名以butterfly_f开头的多张图片
	iv.image = [UIImage animatedImageNamed:@"butterfly_f"
		duration:0.6];
	// 将UIImageView添加到系统界面上
	[self.view addSubview: iv];
	// 启动NSTimer定时器来改变UIImageView的位置
	timer = [NSTimer scheduledTimerWithTimeInterval:0.1
		target:self selector:@selector(changePos)
		userInfo:nil repeats:YES];
}
- (void) changePos
{
	CGPoint curPos = iv.center;
	// 计算一个-4~5之间随机数
	int y = arc4random() % 10 - 4;
	// 当curPos的x坐标已经超过了屏幕的宽度
	if(curPos.x > [UIScreen mainScreen].bounds.size.width)
	{
		// 控制蝴蝶再次从屏幕左侧开始移动
		iv.center = CGPointMake(0, 30);
	}
	else
	{
		// 通过修改iv的center属性来改变iv控件的位置
		iv.center = CGPointMake(curPos.x + 4, curPos.y + y);
	}
}
@end
