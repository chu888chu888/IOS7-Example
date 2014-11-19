//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int max(int* data , int len)
{
	int max = *data;
	// 采用指针遍历data数组的元素
	for(int* p = data ; p < data + len ; p++)
	{
		// 保证max始终存储较大的值
		if(*p > max)
		{
			max = *p;
		}
	}
	return max;
}
int avg(int* data , int len)
{
	int sum = 0;
	// 采用指针遍历data数组的元素	
	for(int* p = data ; p < data + len ; p++)
	{
		// 累加所有数组元素的值
		sum += *p;
	}
	return sum / len;
}
int main(int argc , char * argv[])
{
	@autoreleasepool{
		int data[] = {20 , 12 , 8 , 36, 24};
		// 定义指向函数的指针变量：fnPt，并将max函数的入口赋给fnPt
		int (*fnPt)() = max;
		NSLog(@"最大值：%d" , (*fnPt)(data , 5));
		// 将avg函数的入口赋给fnPt
		fnPt = avg;
		NSLog(@"最大值：%d" , (*fnPt)(data , 5));
	}
}
