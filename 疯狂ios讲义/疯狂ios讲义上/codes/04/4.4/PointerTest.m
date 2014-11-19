//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 定义一个int型变量
		int a = 200;
		// 定义一个指向int变量的指针
		int* p;
		// 将a变量的指针（内存地址）赋值给p指针变量
		p = &a;
		// *p表示取出p指针所指变量
		NSLog(@"%d" , *p);
		// 对a变量先取指针，再获取该指针所指变量，又回到变量a，
		// 因此下面代码将输出1（代表真）
		NSLog(@"%d" , a == (*(&a)));
	}
}
