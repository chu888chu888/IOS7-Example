//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 把for循环的初始化条件提出来独立定义
		int count = 0;
		// for循环里只放循环条件
		for( ; count < 10 ; )
		{
			NSLog(@"count: %d" , count);
			// 把循环迭代部分放在循环体之后定义
			count++;
		}
		NSLog(@"循环结束!");
		// 此处将还可以访问count变量
	}
}
