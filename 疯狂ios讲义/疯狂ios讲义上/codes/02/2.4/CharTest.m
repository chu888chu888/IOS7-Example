//  Created by yeeku on 2013-3-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char* argv[]) 
{
	@autoreleasepool {
		// 直接指定单个字符作为字符常量
		char aChar = 'a';
		// 使用转义字符来作为字符常量
		char enterChar = '\r';
		// 直接把一个0～65535范围内的int整数赋给一个char变量
		char c = 97;
		NSLog(@"%c" , c);
	}
}
