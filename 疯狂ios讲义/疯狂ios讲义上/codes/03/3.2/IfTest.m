//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		int age = 30;
		if (age > 20)
		// 只有当age > 20时，下面花括号括起来的语句块才会执行
		// 花括号括起来的语句是一个整体，要么一起执行，要么一起不会执行
		{
			NSLog(@"年龄已经大于20岁了");
			NSLog(@"20岁以上的人应该学会承担责任...");
		}
		
		// 定义变量a ，并为其赋值
		int a = 5;
		if (a)
			// 只要a为非零，系统都当其为真，执行下面的执行体，只有一行代码作为代码块
			NSLog(@"a为非零");
		else
			// 否则，执行下面的执行体，只有一行代码作为代码块
			NSLog(@"a为零");

					
		// 定义变量b
		int b = 5;
		if (b > 4)
			// 如果b>4，执行下面的执行体，只有一行代码作为代码块      
			NSLog(@"b大于4");       
		else                                  
			// 否则，执行下面的执行体，只有一行代码作为代码块
			b--;                                                              
			// 对于下面代码而言，它已经不再是条件执行体的一部分，因此总会执行。
			NSLog(@"b不大于4");
			
			
		// 定义变量c ，并为其赋值
		int c = 5;
		if (c > 4)
		// 如果b>4，执行下面的执行体，将只有c--;一行代码为条件体
			c--;
			// 下面是一行普通代码，不属于条件体
			NSLog(@"c大于4");
		// 此处的else将没有if语句，因此编译出错。
		else
		// 否则，执行下面的执行体，只有一行代码作为代码块
			NSLog(@"c不大于4");
			
	}
}