//
//  FKViewController.m
//  CustomAlertView
//
//  Created by yeeku on 13-6-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
UISwitch* switch1;
UISwitch* switch2;
- (void)viewDidLoad {
	[super viewDidLoad];
}
- (IBAction)clicked:sender
{
	// 创建一个FKCustomAlertView，就像创建普通的UIAlertView一样
	FKCustomAlertView *alert = [[FKCustomAlertView alloc]
		initWithTitle:@"选择一项"
		message:@"请操作两个开关"
		delegate:self
		cancelButtonTitle:@"取消"
		otherButtonTitles:@"确定", nil];
	// 下面定义2个UISwitch控件
	switch1 = [[UISwitch alloc] initWithFrame:CGRectMake(50, 0, 80, 27)];
	[switch1 setOn:YES];
	switch2 = [[UISwitch alloc] initWithFrame:CGRectMake(160, 0, 80, 27)];
   	[switch2 setOn:YES];
	// 创建一个UIImageView控件
	UIImageView* image = [[UIImageView alloc]
		initWithImage:[UIImage imageNamed:@"ic_launcher.png"]];
	// 设置UIImageView控件的大小和位置
	image.frame = CGRectMake(120, 120, 48, 48);
	alert.extHeight = 100;
	// 为自定义FKCustomAlertView控件设置需要添加的3个控件
	alert.items = [NSArray arrayWithObjects:switch1, switch2,image, nil];
	[alert show];
}
- (void)alertView:(UIAlertView *)alertView
	clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if(buttonIndex == 1)
	{
		NSLog(@"您是否打开第一个开关:%d，您是否打开第二个开关:%d"
			, switch1.on , switch2.on);
	}
}
@end