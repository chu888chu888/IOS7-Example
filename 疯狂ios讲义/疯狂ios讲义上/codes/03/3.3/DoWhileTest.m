//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 定义变量count
		int count = 1;
		// 执行do while循环
		do
		{
			NSLog(@"count: %d" ,count);
			// 循环迭代语句
			count++;
			// 循环条件紧跟while关键字
		}while (count < 10);
		NSLog(@"循环结束!");
		
		// 定义变量count2
		int count2 = 20;
		// 执行do while循环
		do
			// 这行代码把循环体和迭代部分合并成了一行代码
			NSLog(@"count: %d" , count2++);
		while (count2 < 10);
		NSLog(@"循环结束!");
		
	}
}
