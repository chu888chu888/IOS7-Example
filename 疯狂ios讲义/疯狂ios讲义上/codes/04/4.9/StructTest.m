//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 定义point结构体类型
		struct point 
		{
			int x;
			int y;
		};
		//  使用结构体类型定义2个变量
		struct point p1;
		struct point p2;
		// 定义rect结构体类型
		struct rect 
		{
			int x;
			int y;
			int width;
			int height;
		};
		//  使用结构体类型定义2个变量
		struct rect rect1;
		struct rect rect2;	
	}
}