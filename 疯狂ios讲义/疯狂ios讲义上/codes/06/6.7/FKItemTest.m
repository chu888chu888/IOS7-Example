//  Created by yeeku on 2013-4-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKItem.h"

int main(int argc , char * argv[])
{
	// 调用new方法创建对象，该对象的引用计数为0
	FKItem* item = [FKItem new];
	NSLog(@"%ld" , item.retainCount);
	[item retain]; // 引用计数加1，retainCount为2
	NSLog(@"%ld" , item.retainCount);
	[item retain]; // 引用计数加1，retainCount为3
	NSLog(@"%ld" , item.retainCount);
	[item release]; // 引用计数减1，retainCount为2
	NSLog(@"%ld" , item.retainCount);	
	[item retain]; // 引用计数加1，retainCount为3
	NSLog(@"%ld" , item.retainCount);
	[item release]; // 引用计数减1，retainCount为2
	NSLog(@"%ld" , item.retainCount);
	[item release]; // 引用计数减1，retainCount为1
	NSLog(@"%ld" , item.retainCount);
	[item release]; // 引用计数减1，retainCount为0
	// 系统会自动调用该对象的dealloc方法来销毁它，
	// 后面代码不要再调用item指针的方法，调用item方法看到的都是假象，甚至可能导致程序崩溃
}
