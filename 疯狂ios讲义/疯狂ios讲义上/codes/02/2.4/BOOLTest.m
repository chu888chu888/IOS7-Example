//  Created by yeeku on 2013-3-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 定义一个函数，用于判断a是否大于b
BOOL judge(int a , int b)
{
	// 如果a>b，返回YES。
	if(a > b)
	{
		return YES;
	}
	// 返回NO
	return NO;
}
int main(int argc , char* args[])
{
	@autoreleasepool {
		int a = 20;
		int b = 5;
		// 判断a是否大于b
		NSLog(@"a是否大于b：%d" , judge(a , b));
		BOOL b1 = 1;
		BOOL b2 = 18;
		NSLog(@"b1的值为：%d" , b1);
		NSLog(@"b2的值为：%d" , b2);
		BOOL bo1 = 256;
		NSLog(@"bo1：%d" , bo1);
		BOOL bo2 = 768;
		NSLog(@"bo2：%d" , bo2);
	}
}