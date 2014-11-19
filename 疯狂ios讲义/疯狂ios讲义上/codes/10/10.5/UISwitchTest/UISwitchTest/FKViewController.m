//
//  FKViewController.m
//  UISwitchTest
//
//  Created by yeeku on 13-6-7.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 事件处理方法，当UISwitch的开关状态改变时将会激发该方法
- (IBAction)backChange:(id)sender {
	// 如果该开关已经打开
	if([sender isOn] == YES)
	{
		// 将应用背景设为白色
		self.view.backgroundColor = [UIColor whiteColor];
	}
	else
	{
		// 将应用背景的颜色设为黑色
		self.view.backgroundColor = [UIColor blackColor];
	}
}
@end
