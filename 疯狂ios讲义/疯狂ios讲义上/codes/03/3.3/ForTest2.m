//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 同时定义了三个初始化变量，使用&&来组合多个逻辑表达式
		for (int b = 0, s = 0 , p = 0 
			; b < 10 && s < 4 && p < 10; p++)
		{
			NSLog(@"b:%d" , b++);
			NSLog(@"s:%d, p:%d" , ++s , p);
		}
	}
}
