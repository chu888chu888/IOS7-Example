//
//  FKViewController.m
//  NSNotificationTest
//
//  Created by yeeku on 13-11-4.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#define PROGRESS_CHANGED @"down_progress_changed"

@interface FKViewController ()
{
	NSNotificationCenter* nc;
	NSOperationQueue* queue;
}
@end
@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	nc = [NSNotificationCenter defaultCenter];
	queue = [[NSOperationQueue alloc]init];
	// 设置该队列最多支持10条并发线程
	queue.maxConcurrentOperationCount = 10;
	// 使用视图控制器监听任何对象发出的PROGRESS_CHANGED通知
	[nc addObserver:self selector:@selector(update:)
		name:PROGRESS_CHANGED object:nil];
}

- (IBAction)start:(id)sender {
	__block int progStatus = 0;
	[sender setEnabled:NO];
	// 以传入的代码块作为执行体，创建NSOperation
	NSBlockOperation* operation = [NSBlockOperation
		blockOperationWithBlock:^{
			for (int i = 0 ; i < 100;  i++)
			{
				// 暂停0.5秒模拟耗时任务
				[NSThread sleepForTimeInterval:0.5];
				// 创建NSNotification，并指定userInfo信息
				NSNotification* noti = [NSNotification notificationWithName:PROGRESS_CHANGED object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
					[NSNumber numberWithInt:++progStatus], @"prog" , nil]];
				// 发送通知
				[nc postNotification:noti];
			}
		}];
	// 将NSOperation添加给NSOperationQueue
	[queue addOperation:operation];
}
- (void)update:(NSNotification*) noti
{
	// 通过userInfo属性获取耗时任务的进度信息
	NSNumber* progStatus = noti.userInfo[@"prog"];
	NSLog(@"%d" , progStatus.intValue);
	dispatch_async(dispatch_get_main_queue(), ^{
		self.prog.progress = progStatus.intValue / 100.0;
		// 当任务执行进度执行到100时，启用按钮
		if (progStatus.intValue == 100) {
			[self.bn setEnabled:YES];
		}
	});
}
@end
