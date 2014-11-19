//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 定义一个循环计数变量
		int i = 0;
		start:
		NSLog(@"i: %d" , i);
		i++;
		// 如果i小于10，再次跳转到start标签处
		if(i < 10)
		{
			goto start;
		}
	}
}
