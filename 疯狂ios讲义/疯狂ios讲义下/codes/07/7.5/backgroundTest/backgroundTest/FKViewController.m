
//
//  FKViewController.m
//  backgroundTest
//
//  Created by yeeku on 13-9-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 使用默认通知中心监听应用转入后台的过程
	// 应用转入后台时会向通知中心发送UIApplicationDidEnterBackgroundNotification
	// 从而激发enterBack:方法
	[[NSNotificationCenter defaultCenter] addObserver:self
		selector:@selector(enterBack:)
		name:UIApplicationDidEnterBackgroundNotification
		object:[UIApplication sharedApplication]];
}
- (void) enterBack:(NSNotification*)notification
{
	UIApplication* app = [UIApplication sharedApplication];
	// 定义一个UIBackgroundTaskIdentifier类型（本质就是NSUInteger)的变量，
	// 该变量将作为后台任务的标示符
	__block UIBackgroundTaskIdentifier backTaskId;
	backTaskId = [app beginBackgroundTaskWithExpirationHandler:^
	{
		NSLog(@"===在额外申请的10分钟内依然没有完成任务===");
		// 结束后台任务
		[app endBackgroundTask:backTaskId];
	}];
	if(backTaskId == UIBackgroundTaskInvalid)
	{
		NSLog(@"===iOS版本不支持后台运行，后台任务启动失败===");
		return;
	}
	// 将代码块以异步方式提交给系统的全局并发队列
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
		, ^{
			NSLog(@"===额外申请的后台任务时间为：%f==="
				, app.backgroundTimeRemaining);
			// 其他内存清理的代码也可在此处完成
			for(int i = 0 ; i < 100 ; i ++)
			{
				NSLog(@"下载任务完成了%d%%" , i );
				// 暂停10秒模拟正在执行后台下载
				[NSThread sleepForTimeInterval:10];
			}
			NSLog(@"===剩余的后台任务时间为：%f==="
				  , app.backgroundTimeRemaining);
			// 结束后台任务
			[app endBackgroundTask:backTaskId];
		});
}
@end
