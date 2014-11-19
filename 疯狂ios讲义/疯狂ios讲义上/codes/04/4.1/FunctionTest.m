//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 定义一个函数，声明2个形参，返回值为int型
int max(int x , int y)
{
	// 定义一个变量z，该变量等于x、y中较大的值
	int z = x > y ? x : y;
	// 返回变量z的值
	return z;
}
// 定义一个函数，声明一个形参，返回值为NSString *类型
NSString * sayHi(NSString * name)
{
	NSLog(@"===正在执行sayHi函数===");
	return [NSString stringWithFormat:@"%@，您好！" , name];
}
int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		int a = 6;
		int b = 9;
		// 调用max函数，将函数返回值赋值给result变量
		int result = max(a , b); // ①
		NSLog(@"%d" , result);
		// 调用sayHi()函数，直接输出函数的返回值
		NSLog(@"%@" , sayHi(@"孙悟空"));  // ②
	}
}
