//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 定义__block修饰的局部变量
		__block int my = 20;
		void (^printMy)(void) = ^(void)
		{
			// 运行时候访问、获取局部变量的值，此处输出45
			NSLog(@"%d" , my);
			// 尝试对__block局部变量赋值是允许的
			my = 30; // ①
			// 此处输出30
			NSLog(@"%d" , my);
		};
		// 再次将my赋值为45
		my = 45;
		// 调用块
		printMy();
		// 由于块修改了__block局部变量的值，因此下面代码输出30
		NSLog(@"块执行完后，my的值为：%d" , my);
	}
}