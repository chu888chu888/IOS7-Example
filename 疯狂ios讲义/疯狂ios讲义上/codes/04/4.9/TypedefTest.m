//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 定义point结构体类型的同时，还定义结构体变量
		struct point 
		{
			int x;
			int y;
		};
		// 为struct point类型起一个新名称：FKPoint
		typedef struct point FKPoint;
		// 定义一个season枚举类型
		enum season {spring, summer, fall , winter};
		// 为enum season类型起一个新名称：FKSeason
		typedef enum season FKSeason;
		// 使用FKPoint定义p1、p2两个结构体变量
		FKPoint p1;
		FKPoint p2;
		// 使用FKSeason定义s1枚举变量
		FKSeason s1;
	}
}