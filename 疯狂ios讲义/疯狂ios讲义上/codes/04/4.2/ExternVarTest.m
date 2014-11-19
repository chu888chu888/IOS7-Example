//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 声明外部函数
int change();
int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 声明外部外部全局变量
		extern int count;
		// 调用外部函数
		change();
		NSLog(@"%d" , count);
		// 对count变量赋值
		count = 50;
		change();
	}
}
