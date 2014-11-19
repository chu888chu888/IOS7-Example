//
//  FKViewController.m
//  DrawTest
//
//  Created by yeeku on 13-9-7.
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
- (IBAction)draw:(id)sender
{
	// 创建第1个线程对象
	NSThread* thread1 = [[NSThread alloc] initWithTarget:self
		selector:@selector(drawMethod:)
		object:[NSNumber numberWithInt:800]];
	// 创建第2个线程对象
	NSThread* thread2 = [[NSThread alloc] initWithTarget:self
		selector:@selector(drawMethod:)
		object:[NSNumber numberWithInt:800]];
	// 启动2条线程
	[thread1 start];
	[thread2 start];
}
- (void) drawMethod:(NSNumber*) drawAmount
{
	// 直接调用account对象的draw方法来执行取钱
	[account draw:drawAmount.doubleValue];
}
@end
