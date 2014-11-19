//
//  FKViewController.m
//  PatternTest
//
//  Created by yeeku on 13-7-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor blackColor];
	// 隐藏状态条
	[UIApplication sharedApplication].statusBarHidden = YES;
}
@end
