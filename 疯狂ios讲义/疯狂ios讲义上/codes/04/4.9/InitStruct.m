//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 定义point结构体类型的同时，还定义结构体变量
		// 可以直接对结构体变量执行初始化
		struct rect
		{
			int x;
			int y;
			int width;
			int height;
		} rect1 = {20 , 30 , 100 , 200};
		// 下面代码是错误的
//		rect1 = {1 , 2 , 3 , 4};
		// 定义结构体类型
		struct point 
		{
			int x;
			int y;
		};
		// 为struct point类型起一个新名称：FKPoint
		typedef struct point FKPoint;
		// 使用FKPoint定义结构体变量时，允许直接初始化
		FKPoint p1 = {20 , 30};
		FKPoint p2 = {10};
		NSLog(@"p1的x为：%d, p1的y为：%d" , p1.x , p1.y);		
		NSLog(@"p2的x为：%d, p2的y为：%d" , p2.x , p2.y);	
		// 下面代码是错误的
//		p1 = {2 , 3};
		FKPoint p3;
		// 依次对结构体变量的每个成员赋值，这总是正确的
		p3.x = 10;
		p3.y = 100;
		NSLog(@"p3的x为：%d, p3的y为：%d" , p3.x , p3.y);			
	}
}