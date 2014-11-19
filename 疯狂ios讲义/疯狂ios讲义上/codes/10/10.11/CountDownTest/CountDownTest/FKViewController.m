//
//  FKViewController.m
//  CountDownTest
//
//  Created by yeeku on 13-6-11.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
NSTimer* timer;
NSInteger leftSeconds;  // ①
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 设置使用Count Down Timer模式
	self.countDown.datePickerMode = UIDatePickerModeCountDownTimer;
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

- (IBAction)clicked:(id)sender {
	// 获取该倒计时器的剩余时间
	leftSeconds = self.countDown.countDownDuration;
	// 禁用UIDatePicker控件和按钮
	self.countDown.enabled = NO;
	[sender setEnabled:NO];
	// 初始化一个字符串
	NSString *message =  [NSString stringWithFormat:
		@"开始倒计时？您还剩下【%d】秒", leftSeconds];
	// 创建一个UIAlertView（警告框）
	UIAlertView *alert = [[UIAlertView alloc]
					initWithTitle:@"开始倒计时？"
					message:message
					delegate:nil
					cancelButtonTitle:@"确定"
					otherButtonTitles:nil];
	// 显示UIAlertView组件
	[alert show];
	// 启用计时器，控制每隔60秒执行一次tickDown方法
	timer = [NSTimer scheduledTimerWithTimeInterval:60
		target:self selector:@selector(tickDown)
		userInfo:nil repeats:YES];
}
- (void) tickDown
{
	// 将剩余时间减少60秒
	leftSeconds -= 60;
	// 修改UIDatePicker的剩余时间
	self.countDown.countDownDuration = leftSeconds;
	// 如果剩余时间小于等于0
	if(leftSeconds <= 0)
	{
		// 取消定时器
		[timer invalidate];
		// 启用UIDatePicker控件和按钮
		self.countDown.enabled = YES;
		self.startBn.enabled = YES;
	}
}
@end
