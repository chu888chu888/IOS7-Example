//  Created by yeeku on 2013-3-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char* argv[]) 
{
	@autoreleasepool {
		int a  = 6;
		// int自动转换为float类型
		float f = a;
		// 下面将输出6.0
		NSLog(@"%g" , f);
		// 定义一个short类型的整数变量
		short b = 65;
		// short自动转型为char
		char c = b;
		NSLog(@"%c" , c);
		// short型变量可以自动转型为double型
		double d = b;
		// 下面将输出65.0
		NSLog(@"%g" , d);
		double d2 = 97.433;
		// 将doule型值变量复制为int型变量，直接舍弃小数部分
		int it = d2;
		// 下面代码输出97
		NSLog(@"%d" , it);
		// 将doule型值变量复制为int型变量，直接舍弃小数部分
		// ch将等于97对应的字符，也就是小写字母a
		char ch = d2;
		// 下面将输出a
		NSLog(@"%c" , ch);
		int iValue = 33000;
		// 把一个int类型的值转换为short类型的值
		short sValue = iValue;
		// 将输出-32536
		NSLog(@"%d" , sValue);
	}
}
