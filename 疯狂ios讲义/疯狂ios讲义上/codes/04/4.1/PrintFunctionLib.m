//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 定义外部函数，省略extern也是允许的
static void printRect(int height , int width)
{
	// 控制打印height行
	for (int i = 0 ; i < height ; i ++)
	{
		// 控制每行打印width个星号
		for (int j = 0 ; j < width ; j++)
		{
			printf("*");
		}
		printf("\n");
	}
}
// 定义外部函数，省略extern也是允许的
static void printTriangle(int height)
{
	// 控制打印height行
	for (int i = 0 ; i < height ; i ++)
	{
		// 控制打印height - 1 - i个空格
		for (int j = 0 ; j < height - 1 - i ; j++)
		{
			printf(" ");
		}		
		// 控制打印2*i+1个星号
		for (int j = 0 ; j < 2 * i + 1 ; j++)
		{
			printf("*");
		}
		printf("\n");
	}
}