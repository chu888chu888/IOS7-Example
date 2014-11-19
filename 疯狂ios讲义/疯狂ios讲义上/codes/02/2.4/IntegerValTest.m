//  Created by yeeku on 2013-3-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char* argv[])
{
	@autoreleasepool {
	
		// 下面代码是正确的
		int a = 56;
		// 下面代码需要隐式地将9999999999999转为int使用，因此编译器将会提示警告
		int bigValue = 9999999999999;
		// 下面代码是正确的
		long long bigValue2 = 9999999999999;
		NSLog(@"%d" , bigValue);
		NSLog(@"%lld" , bigValue2);
		
		// 以0开头的整数常量是8进制的整数
		int octalValue = 013;
		// 以0x或0X开头的整数常量是16进制的整数
		int hexValue1 = 0x13;
		int hexValue2 = 0XaF;
		
		NSLog(@"%d" , octalValue);
		NSLog(@"%d" , hexValue1);
		NSLog(@"%d" , hexValue2);
		
		// 定义无符号整数
		unsigned int ui = 30;
		unsigned long ul = 200;
		
	}
}