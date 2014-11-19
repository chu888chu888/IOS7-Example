//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKWin.h"

int main(int argc , char * argv[])
{
	FKWin* win = [[FKWin alloc] init];
	NSDate* date = [[NSDate alloc] init];
	// 第一次赋值时，date的引用计数为1
	NSLog(@"date的引用计数为：%ld" , date.retainCount);
	// 由于使用了retain指示符，赋值时导致date的引用计数+1
	[win setDate:date];
	// 下面输出的引用计数为2
	NSLog(@"[win date]的引用计数为：%ld" , [win date].retainCount);
	// 释放date的引用计数，date的引用计数-1
	[date release];
	// 下面输出的引用计数为1
	NSLog(@"[win date]的引用计数为：%ld" , [win date].retainCount);
}
