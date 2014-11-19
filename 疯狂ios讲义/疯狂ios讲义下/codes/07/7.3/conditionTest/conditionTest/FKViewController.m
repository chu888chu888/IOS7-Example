//
//  FKViewController.m
//  conditionTest
//
//  Created by yeeku on 13-9-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "FKAccount.h"
@interface FKViewController ()

@end

@implementation FKViewController
FKAccount* account;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 创建一个账号
	account = [[FKAccount alloc] initWithAccountNo:@"321231" balance: 1000.0];
}

- (IBAction)depositDraw:(id)sender
{
	// 创建、启动3个存钱的线程
	[NSThread detachNewThreadSelector:@selector(drawMethod:) toTarget:self
		withObject:[NSNumber numberWithDouble:800.0]];
	[NSThread detachNewThreadSelector:@selector(drawMethod:) toTarget:self
		withObject:[NSNumber numberWithDouble:800.0]];
	// 创建、启动存钱的线程
	[NSThread detachNewThreadSelector:@selector(drawMethod:) toTarget:self
		withObject:[NSNumber numberWithDouble:800.0]];
	// 创建、启动取钱的线程
	[NSThread detachNewThreadSelector:@selector(depositMethod:) toTarget:self
		withObject:[NSNumber numberWithDouble:800.0]];
}
- (void) drawMethod:(NSNumber*) drawAmount
{
	[NSThread currentThread].name = @"甲";
	// 重复100次执行取钱操作
	for (int i = 0 ; i < 100 ; i++ )
	{
		[account draw:drawAmount.doubleValue];
	}
}
- (void) depositMethod:(NSNumber*) depositAmount
{
	[NSThread currentThread].name = @"乙";
	// 重复100次执行存款操作
	for (int i = 0 ; i < 100 ; i++ )
	{
		[account deposit:depositAmount.doubleValue];
	}
}
@end
