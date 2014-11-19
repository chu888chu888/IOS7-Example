//
//  FKAccount.m
//  conditionTest
//
//  Created by yeeku on 13-9-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKAccount.h"

@implementation FKAccount
NSCondition* cond;
BOOL flag;
- (id)init
{
	self = [super init];
	if (self) {
		cond = [[NSCondition alloc] init];
	}
	return self;
}
- (id)initWithAccountNo:(NSString*)aAccount
				balance:(CGFloat)aBalance
{
	self = [super init];
	if (self) {
		cond = [[NSCondition alloc] init];
		_accountNo = aAccount;
		_balance = aBalance;
	}
	return self;
}
// 提供一个线程安全的draw方法来完成取钱操作
- (void) draw:(CGFloat)drawAmount
{
	// 加锁
	[cond lock];
	// 如果flag为假，表明账户中还没有人存钱进去，取钱方法阻塞
	if (!flag)
	{
		[cond wait];
	}
	else
	{
		// 执行取钱
		NSLog(@"%@ 取钱:%g" , [NSThread currentThread].name
			,drawAmount);
		_balance -= drawAmount;
		NSLog(@"账户余额为：%g" , self.balance);
		// 将标识账户是否已有存款的旗标设为NO。
		flag = NO;
		// 唤醒其他线程
		[cond broadcast];
	}
	[cond unlock];
}
- (void) deposit:(CGFloat) depositAmount
{
	[cond lock];
	// 如果flag为YES，表明账户中已有人存钱进去，则存钱方法阻塞
	if(flag) // ①
	{
		[cond wait];
	}
	else
	{
		// 执行存款
		NSLog(@"%@ 存款:%g" , [NSThread currentThread].name
			, depositAmount);
		_balance += depositAmount;
		NSLog(@"账户余额为：%g" , self.balance);
		// 将表示账户是否已有存款的旗标设为YES
		flag = YES;
		// 唤醒其他线程
		[cond broadcast];
	}
	[cond unlock];
}
- (NSUInteger) hash
{
	return [self.accountNo hash];
}
- (BOOL)isEqual:(id)anObject
{
	if(self == anObject)
		return YES;
	if (anObject != nil
		&& [anObject class] == [FKAccount class])
	{
		FKAccount* target = (FKAccount*)anObject;
		return [target.accountNo isEqualToString:self.accountNo];
	}
	return NO;
}
@end