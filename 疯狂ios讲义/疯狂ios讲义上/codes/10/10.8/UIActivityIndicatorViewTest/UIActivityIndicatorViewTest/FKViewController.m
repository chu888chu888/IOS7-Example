//
//  FKViewController.m
//  UIActivityIndicatorViewTest
//
//  Created by yeeku on 13-6-10.
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

- (IBAction)start:(id)sender {
	// 控制4个进度环开始转动
	for(int i = 0 ; i < self.indicators.count ; i++)
	{
		[[self.indicators objectAtIndex:i] startAnimating];
	}
}

- (IBAction)stop:(id)sender {
	// 停止4个进度环的转动
	for(int i = 0 ; i < self.indicators.count ; i++)
	{
		[[self.indicators objectAtIndex:i] stopAnimating];
	}
}
@end
