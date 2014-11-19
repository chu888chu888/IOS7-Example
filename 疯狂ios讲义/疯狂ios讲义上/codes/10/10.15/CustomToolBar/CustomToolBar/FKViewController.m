//
//  FKViewController.m
//  CustomToolBar
//
//  Created by yeeku on 13-6-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
UIProgressView* prog;
NSTimer* timer;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 创建一个工具条，并设置它的大小和位置
	UIToolbar *myToolbar = [[UIToolbar alloc]
		initWithFrame:CGRectMake(0, 20, 320, 44)];
	// 将工具条添加到当前应用的界面中
	[self.view addSubview:myToolbar];
	// 创建使用文本标题的UIBarButtonItem
	UIBarButtonItem* bn1 = [[UIBarButtonItem alloc]
		initWithTitle:@"OK"
		style:UIBarButtonItemStylePlain
		target:self
		action:@selector(clicked:)];
	// 创建使用自定义图片的UIBarButtonItem	
	UIBarButtonItem* bn2 = [[UIBarButtonItem alloc]
		initWithImage:[UIImage imageNamed:@"heart.gif"]
		style:UIBarButtonItemStyleBordered
		target:self
		action:@selector(clicked:)];
	// 创建使用系统图标的UIBarButtonItem
	UIBarButtonItem* bn3 = [[UIBarButtonItem alloc]
		initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
		target:self
		action:@selector(clicked:)];
	// 创建一个可伸缩的UIBarButtonItem
	UIBarButtonItem *flexItem = [[UIBarButtonItem alloc]
		initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
		target:nil
		action:nil];
	prog = [[UIProgressView alloc]
		initWithProgressViewStyle:UIProgressViewStyleBar];
	// 设置UIProgressView的大小
	prog.frame = CGRectMake(0 , 0 , 80, 20);
	// 设置该进度条的初始进度为0
	prog.progress = 0;
	// 创建使用UIView的UIBarButtonItem
	UIBarButtonItem *bn4 = [[UIBarButtonItem alloc]
		initWithCustomView:prog];
	// 为工具条设置工具按钮
	myToolbar.items = [NSArray arrayWithObjects:
		bn1	, bn2, bn3,flexItem, bn4, nil];
	timer = [NSTimer scheduledTimerWithTimeInterval:0.2
		target:self selector:@selector(changeProgress)
		userInfo:nil repeats:YES];
}
- (void) clicked:(id)sender
{
	NSLog(@"%@", sender);
}
- (void) changeProgress
{
	// 如果进度满了，停止计时器
	if(prog.progress >= 1.0)
	{
		// 停用计时器
		[timer invalidate];
	}
	else
	{
		// 改变进度条的进度值
		[prog setProgress:prog.progress + 0.02 animated:YES];
	}
}
@end
