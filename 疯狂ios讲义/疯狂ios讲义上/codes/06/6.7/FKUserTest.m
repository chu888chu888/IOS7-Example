//  Created by yeeku on 2013-4-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

#import "FKUser.h"

int main(int argc , char * argv[])
{
	// 调用new方法创建对象，该对象的引用计数为0
	FKItem* item = [FKItem new];
	NSLog(@"创建出来的引用计数为：%ld" , item.retainCount);
	FKUser* user = [[FKUser alloc] init];
	[user setItem:item];
	NSLog(@"被FKUser对象持有后的引用计数为：%ld" 
		, item.retainCount);
	// main方法将item的引用计数减1，item的引用计数为1
	[item release];
	NSLog(@"调用release后的引用计数为：%ld" 
		, item.retainCount);
	// user的引用计数减1，user的引用计数为0
	// 系统调用user的dealloc方法，
	// 调用dealloc方法时将会让FKItem的引用计数减1，
	// 这样item的引用计数变为0，系统就会执行item的dealloc方法进行销毁
	[user release];
}
