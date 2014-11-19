//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 定义结构体类型
		struct point 
		{
			int x;
			int y;
		};
		// 为struct point类型起一个新名称：FKPoint
		typedef struct point FKPoint;
		// 定义结构体数组，并初始化数组元素
		FKPoint points[] = {
			{20 , 30},
			{12 , 20},
			{4 , 8}
		};
		// 下面代码是错误的
//		points[1] = {20 , 8};  // ①
		// 单独对结构体变量的每个成员赋值是允许的
		points[1].x = 20;
		points[1].y = 8;
		// 遍历每个结构体数组元素
		for (int i = 0 ; i < 3 ; i++)
		{
			NSLog(@"points[%d]的x是：%d, points[%d]的y是：%d"
				, i , points[i].x, i , points[i].y); 
		}
	}
}