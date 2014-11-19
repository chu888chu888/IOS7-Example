//
//  FKViewController.m
//  NSThreadTest
//
//  Created by yeeku on 13-9-2.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	for(int i = 0 ; i < 100 ; i++)
	{
		NSLog(@"===%@===%d" , [NSThread currentThread].name , i);
		if(i == 20)
		{
			// 创建线程对象
			NSThread *thread = [[NSThread alloc]initWithTarget:self
				selector:@selector(run) object:nil];
			// 启动新线程
			[thread start];
//			// 创建并启动新线程
//			[NSThread detachNewThreadSelector:@selector(run) toTarget:self
//				withObject:nil];
		}
	}
}
- (void)run
{
	for(int i = 0 ; i < 100 ; i++)
	{
		NSLog(@"-----%@----%d" , [NSThread currentThread].name, i);
	}
}
@end
