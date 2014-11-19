//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int fn(int n)
{
	if (n == 0)
	{
		return 1;
	}
	else if (n == 1)
	{
		return 4;
	}
	else
	{
		// 函数中调用它自身，就是函数递归
		return 2 * fn(n - 1) + fn(n - 2);
	}
}

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		//输出fn(10)的结果
		NSLog(@"%d" , fn(10));
	}
}
