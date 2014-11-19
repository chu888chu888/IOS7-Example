//
//  FKViewController.m
//  queueTest
//
//  Created by yeeku on 13-9-9.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
// 定义2个队列
dispatch_queue_t serialQueue;
dispatch_queue_t concurrentQueue;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 创建串行队列
	serialQueue = dispatch_queue_create("fkjava.queue", DISPATCH_QUEUE_SERIAL);
	// 创建并发队列
	concurrentQueue = dispatch_queue_create("fkjava.queue"
		, DISPATCH_QUEUE_CONCURRENT);
}
- (IBAction)serial:(id)sender
{
	// 依次将2个代码块提交给串行队列
	// 必须等到第1个代码块完成后，才能执行第2个代码块。
	dispatch_async(serialQueue, ^(void)
	{
		for (int i = 0 ; i < 100; i ++)
		{
			NSLog(@"%@=====%d"  , [NSThread currentThread] , i);
		}
	});
	dispatch_async(serialQueue, ^(void)
	{
		for (int i = 0 ; i < 100; i ++)
		{
			NSLog(@"%@------%d" , [NSThread currentThread] , i);
		}
	});
}
- (IBAction)concurrent:(id)sender
{
	// 依次将2个代码块提交给并发队列
	// 两个代码块可以并发执行
	dispatch_async(concurrentQueue, ^(void)
	{
		for (int i = 0 ; i < 100; i ++)
		{
			NSLog(@"%@=====%d"  , [NSThread currentThread] , i);
		}
	});
	dispatch_async(concurrentQueue, ^(void)
	{
		for (int i = 0 ; i < 100; i ++)
		{
			NSLog(@"%@------%d" , [NSThread currentThread] , i);
		}
	});
}
@end
