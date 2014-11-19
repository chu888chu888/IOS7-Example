//
//  FKViewController.m
//  UIButtonTest
//
//  Created by yeeku on 13-6-2.
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

- (IBAction)disabledClicked:(id)sender {
	// 切换bn1、bn2两个按钮的enabled状态 。
	// 如果这两个按钮处于启用状态，将它们设为禁用。
	// 如果这两个按钮处于禁用状态，将它们设为启用。
	self.bn1.enabled = !(self.bn1.enabled);
	self.bn2.enabled = !(self.bn2.enabled);
	// 切换事件源（第5个按钮）上的文本标题
	if([[sender titleForState:UIControlStateNormal] isEqualToString:@"禁用"])
	{
		[sender setTitle:@"启用" forState:UIControlStateNormal];
	}
	else
	{
		[sender setTitle:@"禁用" forState:UIControlStateNormal];

	}
}
@end
