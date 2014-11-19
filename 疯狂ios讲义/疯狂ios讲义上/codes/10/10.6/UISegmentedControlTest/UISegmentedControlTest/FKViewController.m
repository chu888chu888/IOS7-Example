//
//  FKViewController.m
//  UISegmentedControlTest
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (IBAction)segmentChanged:(id)sender {
	// 根据UISegmentedControl被选中的索引
	switch ([sender selectedSegmentIndex]) {
		case 0:
			// 将应用背景设为红色
			self.view.backgroundColor = [UIColor redColor];
			break;
		case 1:
			// 将应用背景设为绿色
			self.view.backgroundColor = [UIColor greenColor];
			break;
		case 2:
			// 将应用背景设为蓝色
			self.view.backgroundColor = [UIColor blueColor];
			break;
		case 3:
			// 将应用背景设为紫色
			self.view.backgroundColor = [UIColor purpleColor];
			break;
	}
}
@end
