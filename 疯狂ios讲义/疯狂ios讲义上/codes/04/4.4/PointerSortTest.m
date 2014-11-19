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
}
void exchange(int* p1 , int* p2 , int* p3)
{
	// 如果p1所指变量的值大于p2所指变量的值，交换p1、p2所指变量的值
	if(*p1 > *p2) swap(p1 , p2);
	// 如果p1所指变量的值大于p3所指变量的值，交换p1、p3所指变量的值	
	if(*p1 > *p3) swap(p1 , p3);
	// 如果p2所指变量的值大于p3所指变量的值，交换p2、p3所指变量的值	
	if(*p2 > *p3) swap(p2 , p3);
}
int main(int argc , char * argv[])
{
	@autoreleasepool{
		int a = 25;
		int b = 4;
		int c = 19;
		// 对a、b、c进行排序
		exchange(&a , &b , &c);
		NSLog(@"a的值为：%d,b的值为：%d,c的值为：%d" 
			, a , b , c);
	}
}

