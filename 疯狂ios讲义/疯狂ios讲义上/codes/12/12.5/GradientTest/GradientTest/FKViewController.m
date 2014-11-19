//
//  FKViewController.m
//  GradientTest
//
//  Created by yeeku on 13-7-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "FKGradientView.h"
@interface FKViewController ()

@end

@implementation FKViewController
FKGradientView* gradientView;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 创建FKGradientView控件，并将它添加到scrollView控件中
	gradientView = [[FKGradientView alloc] initWithFrame:
					self.scrollView.bounds];
	[self.scrollView addSubview:gradientView];
}
// 响应UISegmentedControl控件的Value Changed事件的事件处理方法
- (IBAction)changeType:(id)sender
{
	gradientView.type = ((UISegmentedControl*)sender).selectedSegmentIndex;
}
// 响应第1个UISwitch控件的Value Changed事件的事件处理方法
- (IBAction)beforeStart:(id)sender
{
	gradientView.beforeStart = ((UISwitch*)sender).isOn;
}
// 响应第2个UISwitch控件的Value Changed事件的事件处理方法
- (IBAction)afterEnd:(id)sender
{
	gradientView.afterEnd = ((UISwitch*)sender).isOn;
}
@end
