//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

void map(int* data , int len , int (*fn)())
{
	// 采用指针遍历data数组的元素
	for(int* p = data ; p < data + len ; p++)
	{
		// 调用fn函数（fn函数是动态传入的）
		printf("%d , " , (*fn)(*p));
	}
	printf("\n");
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
		map(data , 5 , noChange);
		NSLog(@"计算数组元素平方");
		map(data , 5 , square);
		NSLog(@"计算数组元素立方");
		map(data , 5 , cube);
	}
}
