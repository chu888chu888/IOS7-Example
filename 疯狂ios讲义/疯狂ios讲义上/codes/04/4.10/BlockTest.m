//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 定义不带参数、无返回值的块
		void (^printStr)(void) = ^(void)
		{
			NSLog(@"我正在开始学习Objective-C的块");
		};
		// 使用printStr调用块
		printStr();
		// 定义带参数、有返回值的块
		double (^hypot)(double , double) = 
			^(double num1, double num2)
		{
			return sqrt(num1 * num1 + num2 * num2);
		};
		// 调用块，并输出块的返回值
		NSLog(@"%g" , hypot(3, 4));
		// 也可以先只定义块变量：定义带参数、无返回值的块
		void (^print)(NSString*);
		// 再将块赋给指定的块变量
		print = ^(NSString* info)
		{
			NSLog(@"info参数为：%@" , info);
		};
		// 调用块
		print(@"疯狂iOS讲义");
	}
}