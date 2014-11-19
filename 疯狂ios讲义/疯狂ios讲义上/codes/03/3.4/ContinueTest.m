//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 一个简单的for循环
		for (int i = 0; i < 3 ; i++ )
		{
			NSLog(@"i的值是: %d" , i);
			if (i == 1)
			{
				// 忽略本次循环的剩下语句
				continue;
			}
			NSLog(@"continue后的输出语句");
		}
	}
}
