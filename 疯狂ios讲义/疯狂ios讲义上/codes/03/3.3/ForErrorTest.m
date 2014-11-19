//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 循环的初始化条件,循环条件，循环迭代语句都在下面一行
		for (int count = 0 ; count < 10 ; count++)
		{
			NSLog(@"count: %d" , count);
			// 再次修改了循环变量
			count *= 0.1;
		}
		NSLog(@"循环结束!");
	}
}
