//
//  FKViewController.m
//  ThreadCancel
//
//  Created by yeeku on 13-9-6.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end
@implementation FKViewController
NSThread* thread;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 创建新线程对象
	thread = [[NSThread alloc] initWithTarget:self selector:@selector(run)
		object:nil];
	// 启动新线程
	[thread start];
}
- (void)run
{
	for(int i = 0 ; i < 100 ; i++)
	{
		if([NSThread currentThread].isCancelled)
		{
			// 终止当前正在执行的线程
			[NSThread exit];
		}
		NSLog(@"-----%@----%d" , [NSThread currentThread].name, i);
		// 每执行一次，线程暂停0.5秒
		[NSThread sleepForTimeInterval:0.5];
	}
}
- (IBAction)cancelThread:(id)sender
{
	// 取消thread线程，调用该方法后，thread的isCancelled方法将会返回NO
	[thread cancel]; // ①
}
@end
