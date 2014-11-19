//  Created by yeeku on 2013-3-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char* args[])
{
	@autoreleasepool {
		int a = 56;
		NSLog(@"==%d==" , a);
		// 输出整数占9位
		NSLog(@"==%9d==" , a);
		// 输出整数占9位，并且左对齐	
		NSLog(@"==%-9d==" , a);
		// 输出8进制数
		NSLog(@"==%o==" , a);
		// 输出16进制数
		NSLog(@"==%x==" , a);
		long b = 12;
		// 输出long int型的整数
		NSLog(@"%ld" , b);
		// 以16进制输出long int型的整数
		NSLog(@"%lx" , b);
		double d1 = 2.3;
		// 以小数形式输出浮点数
		NSLog(@"==%f==" , d1);
		// 以指数形式输出浮点数
		NSLog(@"==%e==" , d1);
		// 以最简形式输出浮点数
		NSLog(@"==%g==" , d1);
		// 以小数形式输出浮点数，并且最少占用9位
		NSLog(@"==%9f==" , d1);
		// 以小数形式输出浮点数，至少占用9位，小数点共4位
		NSLog(@"==%9.4f==" , d1);
		long double d2 = 2.3;
		// 以小数形式输出长浮点数
		NSLog(@"==%lf==" , d1);
		// 以指数形式输出长浮点数
		NSLog(@"==%le==" , d1);
		// 以最简形式输出长浮点数
		NSLog(@"==%lg==" , d1);
		// 以小数形式输出长浮点数，并且最少占用9位
		NSLog(@"==%9lf==" , d1);
		// 以小数形式输出长浮点数，至少占用9位，小数点共4位
		NSLog(@"==%9.4lf==" , d1);
		NSString *str = @"疯狂iOS";
		// 输出Objective-C的字符串 
		NSLog(@"==%@==" , str);
		NSDate *date = [[NSDate alloc] init];
		// 输出Objective-C对象
		NSLog(@"==%@==" , date);		
	}
}