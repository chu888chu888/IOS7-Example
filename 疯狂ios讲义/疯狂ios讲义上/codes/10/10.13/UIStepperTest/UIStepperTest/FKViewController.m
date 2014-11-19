//
//  FKViewController.m
//  UIStepperTest
//
//  Created by yeeku on 13-6-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	// 自定义该UIStepper的减号按钮的图片
	[self.stepper setDecrementImage:[UIImage imageNamed:@"minus.gif"]
		forState:UIControlStateNormal];
	// 自定义该UIStepper的减号按钮的图片
	[self.stepper setIncrementImage:[UIImage imageNamed:@"plus.gif"]
		forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)valueChanged:(UIStepper*)sender {
	// 分别使用3个UITextField显示对应UIStepper的值
	switch (sender.tag) {
		case 1:
			self.tf1.text = [NSString stringWithFormat:@"%g"
				, sender.value];
			break;
		case 2:
			self.tf2.text = [NSString stringWithFormat:@"%g"
				, sender.value];
			break;
		case 3:
			self.tf3.text = [NSString stringWithFormat:@"%g"
				, sender.value];
			break;
	}
}
@end
