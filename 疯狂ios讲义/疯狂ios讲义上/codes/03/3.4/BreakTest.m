//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 一个简单的for循环
		for (int i = 0; i < 10 ; i++ )
		{
			NSLog(@"i的值是: %d" , i);
			if (i == 2)
			{
				// 执行该语句时将结束循环
				break;
			}
		}
	}
}
