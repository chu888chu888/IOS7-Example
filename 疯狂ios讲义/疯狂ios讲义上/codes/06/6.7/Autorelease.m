//  Created by yeeku on 2013-4-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKItem.h"
#import "FKUser.h"

FKItem* productItem()
{
	FKItem* item = [FKItem new]; // 引用计数为1
	NSLog(@"函数返回之前的引用计数：%ld" , item.retainCount);
	// autorelease不会改变对象的引用计数
	// 但程序执行autorelease方法时，会将该对象添加到自动释放池中
	return [item autorelease];
}

int main(int argc , char * argv[])
{
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	// it的引用计数为1
	FKItem* it = productItem();
	// 接下来可以调用it的方法
	NSLog(@"%ld" , it.retainCount);
	// ...
	// 创建一个FKUser对象，并将它添加到自动释放池
	FKUser* user = [[[FKUser alloc] init] autorelease];
	// 接下来可以调用user的方法
	NSLog(@"%ld" , user.retainCount);
	// ...
	// 系统将因为池的引用计数变为0而回收自动释放池，
	// 回收自动释放池时会调用池中所有对象的release方法
	[pool release];
}