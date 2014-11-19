//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 循环的初始化条件
		int count = 0;
		// 当count小于10时，执行循环体
		while (count < 10) 
		{
			NSLog(@"count:%d", count);
			// 迭代语句
			count++;
		}
		NSLog(@"循环结束!");
		
		// 下面是一个死循环
		int count2 = 0;
		while (count2 < 10)
		{
			NSLog(@"不停执行的死循环 %d " , count2);
			count2--;
		}
		NSLog(@"永远无法跳出的循环体");
		
	}
}
