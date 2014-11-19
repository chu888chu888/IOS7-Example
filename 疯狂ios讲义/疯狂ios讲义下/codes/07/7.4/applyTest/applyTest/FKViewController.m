//
//  FKViewController.m
//  applyTest
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
	// 控制代码块执行5次
	dispatch_apply(5
		, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
		// time形参代表当前正在执行第几次
		, ^(size_t time)
		{
			NSLog(@"===执行【%lu】次===%@" , time
				, [NSThread currentThread]);
		});
}
@end
