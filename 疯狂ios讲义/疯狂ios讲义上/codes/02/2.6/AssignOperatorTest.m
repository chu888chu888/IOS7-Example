//  Created by yeeku on 2013-3-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool {
		// 为变量str赋值为Objective-C
		NSString *str = @"Objective-C";
		// 为变量pi赋值为3.14
		double pi = 3.14;
		// 为变量visited赋值为YES
		BOOL visited = YES;
		// 将变量str的值赋给str2
		NSString *str2 = str;
		
		int a;
		int b;
		int c;
		// 通过为a, b , c赋值，三个变量的值都是7
		a = b = c = 7;
		// 输出三个变量的值。
		NSLog(@"%d , %d , %d" , a , b , c);
		
		double d1 = 12.34;
		// 将表达式的值赋给d2
		double d2 = d1 + 5;
		// 输出d2的值
		NSLog(@"%g" ,d2);
	
	}
}