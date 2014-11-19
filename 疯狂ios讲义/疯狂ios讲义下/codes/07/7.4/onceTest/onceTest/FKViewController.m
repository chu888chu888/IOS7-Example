//
//  FKViewController.m
//  onceTest
//
//  Created by yeeku on 13-9-9.
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
- (IBAction)clicked:(id)sender
{	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		NSLog(@"==执行代码块==");
		// 线程暂停3秒
		[NSThread sleepForTimeInterval:3];
	});
}
@end
