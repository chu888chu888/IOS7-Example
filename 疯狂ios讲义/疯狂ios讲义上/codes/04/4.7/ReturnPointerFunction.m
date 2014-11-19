//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#define LENGTH 5

int* map(int* data ,int (*fn)())
{
 	static int result[LENGTH];
	int i = 0;
	// 采用指针遍历data数组的元素
	for(int* p = data; p < data + LENGTH ; p++)
	{
		// 调用fn函数（fn函数是动态传入的）
		result[i++] = (*fn)(*p);
	}
	// 返回result的首地址
	return result;
}
int noChange(int val)
{
	return val;
}
// 定义一个计算平方的函数
int square(int val)
{
	return val * val;
}
// 定义一个计算立方的函数
int cube(int val)
{
	return val * val * val;
}
int main(int argc , char * argv[])
{
	@autoreleasepool{
		int data[] = {20 , 12 , 8 , 36, 24};
		// 下面程序代码3次调用map()函数，每次调用时传入不同的函数
		int* arr1 = map(data , noChange);
		for(int i = 0 ; i < LENGTH ; i ++)
		{
			printf("%d , " , *(arr1 + i));
		}
		printf("\n");
		int* arr2 = map(data , square);
		for(int i = 0 ; i < LENGTH ; i ++)
		{
			printf("%d , " , *(arr2 + i));
		}
		printf("\n");
		int* arr3 = map(data , cube);
		for(int i = 0 ; i < LENGTH ; i ++)
		{
			printf("%d , " , *(arr3 + i));
		}
		printf("\n");
	}
}
