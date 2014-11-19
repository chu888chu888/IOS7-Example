//
//  FKAccount.m
//  DrawTest
//
//  Created by yeeku on 13-9-7.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKAccount.h"

@implementation FKAccount
- (id)initWithAccountNo:(NSString*)aAccount
				balance:(CGFloat)aBalance
{
	self = [super init];
	if (self) {
		_accountNo = aAccount;
		_balance = aBalance;
	}
	return self;
}
// 提供一个线程安全的draw方法来完成取钱操作
- (void) draw:(CGFloat)drawAmount
{
	// 使用self作为同步监视器，任何线程进入下面同步代码块之前，
	// 必须先获得对self账户的锁定——其他线程无法获得锁，也就无法修改它
	// 这种做法符合：“加锁 → 修改 → 释放锁”的逻辑	
	@synchronized(self)
	{
		// 账户余额大于取钱数目
		if (self.balance >= drawAmount)
		{
			// 吐出钞票
			NSLog(@"%@取钱成功！吐出钞票:%g", [NSThread currentThread].name
				, drawAmount);
			[NSThread sleepForTimeInterval:0.001];
			// 修改余额
			_balance = _balance - drawAmount;
			NSLog(@"\t余额为: %g" , self.balance);
		}
		else
		{
			NSLog(@"%@取钱失败！余额不足！", [NSThread currentThread].name);
		}
	}//同步代码块结束，该线程释放同步锁
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
