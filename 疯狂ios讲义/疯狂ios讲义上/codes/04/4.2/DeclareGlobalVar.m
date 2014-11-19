//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

void change()
{
	// 声明本函数将要使用的全局变量
	extern int globalVar;
	globalVar = 20;
}
int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 声明本函数将要使用的全局变量
		extern int globalVar;
		NSLog(@"%d" , globalVar);
		change();
		NSLog(@"%d" , globalVar);
	}
}
// 定义全局变量
int globalVar;