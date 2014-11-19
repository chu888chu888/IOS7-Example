//
//  FKViewController.m
//  PriorityTest
//
//  Created by yeeku on 13-9-6.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	NSLog(@"UI线程的优先级为：%g" , [NSThread threadPriority]);
	// 创建第一个线程对象
	NSThread* thread1 = [[NSThread alloc]
		initWithTarget:self selector:@selector(run) object:nil];
	// 设置第一个线程对象的名字
	thread1.name = @"线程A";
	NSLog(@"线程A的优先级为：%g" , thread1.threadPriority);
	// 设置使用最低优先级
	thread1.threadPriority = 0.0;
	// 创建第二个线程对象
	NSThread* thread2 = [[NSThread alloc]
		initWithTarget:self selector:@selector(run) object:nil];
	// 设置第二个线程对象的名字
	thread2.name = @"线程B";
	NSLog(@"线程B的优先级为：%g" , thread2.threadPriority);
	// 设置使用最高优先级
	thread2.threadPriority = 1.0;
	// 启动2个线程
	[thread1 start];
	[thread2 start];
}
- (void)run
{
	for(int i = 0 ; i < 100 ; i++)
	{
		NSLog(@"-----%@----%d" , [NSThread currentThread].name, i);
	}
}
@end
