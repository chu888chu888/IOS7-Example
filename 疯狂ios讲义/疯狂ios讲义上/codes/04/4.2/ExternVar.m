//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
// 定义全局变量
int count = 0;
// 定义一个函数
void change()
{
	NSLog(@"count的值为：%d" , count);
	count = 20;
}

