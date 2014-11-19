//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int fac(int n)
{
	// static变量，第一次运行时该变量的值为1
	// f可以保留上一次调用函数的结果
	static int f = 1;
	f = f * n;
	return f;
}
int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 采用循环，控制调用该函数7次
		for(int i = 1 ; i < 8 ; i++)
		{
			NSLog(@"%d的阶乘为：%d", i , fac(i));
		}
	}
}
