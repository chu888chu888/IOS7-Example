//
//  FKViewController.m
//  syncTest
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
	// 以同步方式先后提交2个代码块
	dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
		, ^(void){
			for (int i = 0 ; i < 100; i ++)
			{
				NSLog(@"%@=====%d"  , [NSThread currentThread] , i);
				[NSThread sleepForTimeInterval:0.1];
			}
		});
	// 必须等第一次提交的代码块执行完成后，dispatch_sync()函数才会返回，
	// 程序才会执行到这里，才能提交第二个代码块。
	dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
		, ^(void){
			for (int i = 0 ; i < 100; i ++)
			{
				NSLog(@"%@-----%d"  , [NSThread currentThread] , i);
				[NSThread sleepForTimeInterval:0.1];
			}
		});
}
@end
