//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

void fac(int n)
{
	auto int a = 1;
	// 定义静态局部变量，每次函数调用结束后，都会保存该变量的值
	static int b = 1;
	// a（每次调用时a总是等于1）的值加上n
	a += n;
	// b（b变量可以保留上一次调用的结果）的值加上n
	b += n;
	NSLog(@"a的值为：%d , b的值为%d" , a , b);
}
int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 采用循环调用了fac()函数4次
		for(int i = 0 ; i < 4 ; i++)
		{
			fac(i);
		}
	}
}
