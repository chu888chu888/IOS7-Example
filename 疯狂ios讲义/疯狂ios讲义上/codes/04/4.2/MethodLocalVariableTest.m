//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 定义一个函数局部变量a
		int a;
		// 下面代码输出的值不确定，通常是0
		NSLog(@"函数局部变量a的值： %d" , a);
		// 为a变量赋值。
		a = 5;
		// 下面代码将输出0
		NSLog(@"函数局部变量a的值： %d" , a);
	}
}
