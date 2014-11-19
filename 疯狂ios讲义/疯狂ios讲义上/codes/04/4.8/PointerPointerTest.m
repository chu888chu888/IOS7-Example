//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		int a = 20;
		int* p = &a;
		int** pt = &p;
		// 输出指针变量p保存的地址
		NSLog(@"%p" , p);
		// 输出指针变量pt保存的地址
		NSLog(@"%p" , pt);
		// 输出指针变量pt所指变量（依然是指针）中保存的地址
		NSLog(@"%p" , *pt);
		// 输出pt所指的指针变量指向的变量的值
		NSLog(@"%d" , **pt);		
	}
}
