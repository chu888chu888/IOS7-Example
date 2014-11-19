//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 定义局部变量
		int my = 20;
		void (^printMy)(void) = ^(void)
		{
			// 尝试对局部变量赋值，程序将会报错
//			my = 30; // ①		
			// 访问局部变量的值是允许的
			NSLog(@"%d" , my);
		};
		// 再次将my赋值为45
		my = 45;
		// 调用块
		printMy();
	}
}