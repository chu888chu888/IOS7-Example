//  Created by yeeku on 2013-3-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool {
		// 定义枚举类型
		enum season {spring = 4, summer = 1, fall , winter};
		// 定义两个枚举变量
		enum season myLove , yourLove;
		// 为两个枚举变量赋值
		myLove = winter;
		yourLove = fall;
		// 把枚举值当成无符号整数执行输出
		NSLog(@"winter的值：%u" , myLove);
		NSLog(@"fall的值：%u" , fall);		
		if(spring > winter)
		{
			NSLog(@"春天大于冬天吗");
		}
		// 定义匿名枚举类型，并定义两个枚举变量
		enum {male , female} me , you;
		// 为两个变量赋值
		me = male;
		// 直接赋整数值给枚举变量
		you = 1;
		NSLog(@"you的值：%u" , you);
		// 直接把枚举值当成整数使用
		int iVal = you * 2 + 12 + me;
		NSLog(@"%d" , iVal);
	}
}