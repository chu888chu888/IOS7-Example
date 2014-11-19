//  Created by yeeku on 2013-3-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char* argv[]) 
{
	@autoreleasepool {
		// 定义一个short类型变量
		short sValue = 5;
		// 表达式中的sValue将自动提升到int类型，因此下面表达式占用空间将输出4
		NSLog(@"%ld" , sizeof(sValue - 2));
		// 2.0是浮点数，因此下面计算结果也是浮点数
		double d = 5 / 2.0;
		NSLog(@"%g" , d);
	}
}
