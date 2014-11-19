//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

void swap(int a , int b)
{
	// 下面三行代码实现a、b变量的值交换。
	// 定义一个临时变量来保存a变量的值
	int tmp = a;
	// 把b的值赋给a
	a = b;
	// 把临时变量tmp的值赋给a
	b = tmp;
	NSLog(@"swap函数里，a的值是：%d；b的值是%d" , a, b);
}

int main(int argc , char * argv[])
{
	@autoreleasepool{
		int a = 6;
		int b = 9;
		swap(a , b);
		NSLog(@"交换结束后，变量a的值是：%d；变量b的值是：%d"
			, a , b); 
	}
}
