//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		int len = 5;
		int arr[5];
		// 将数组arr的首地址赋给指针变量p，
		// 也就是将p指向arr数组的第一个元素
		int* p = arr;
		// 让指针变量p依次指向下一个元素
		for( ; p < arr + len ; p++)
		{
			// 读取一个整数，依次赋值给变量p
			scanf("%d" , p);
		}
		NSLog(@"---输出数组元素---");
		// 采用遍历输出数组元素
//		for(int i = 0 ; i < len ; i++)
//		{
//			NSLog(@"%d" , *(p + i));
//		}
		// 循环开始时，让p指向arr数组的第一个元素
		for(p = arr ; p < arr + len ; p++)
		{
			NSLog(@"%d" , *p);
		}
	}
}