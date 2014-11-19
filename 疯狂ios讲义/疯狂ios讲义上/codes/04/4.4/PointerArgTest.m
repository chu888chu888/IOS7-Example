//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

void swap(int* p1 , int* p2)
{
	// 将p1所指变量的值赋给tmp
	int tmp = *p1;
	// 将p2所指变量的值赋给p1所指的变量
	*p1 = *p2;
	// 将tmp变量的值赋值给p2所指的变量
	*p2 = tmp;
	// 将p1、p2两个指针赋为nil，也就是不指向任何地址
	p1 = p2 = nil;  // ①
}
int main(int argc , char * argv[])
{
	@autoreleasepool{
		int a = 5;
		int b = 9;
		// 定义指针变量pa保存变量a的地址
		int* pa = &a;
		// 定义指针变量pb保存变量b的地址
		int* pb = &b;
		// 调用swap()函数对a、b交换a、b两个变量的值
		swap(&a , &b);
		NSLog(@"a的值为：%d,b的值为：%d" , a , b);
		// 再次输出pa、pb指针变量的值（内存地址）
		NSLog(@"pa的值为：%p,pb的值为：%p" , pa , pb);
	}
}

