//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		int count = 0;
		// while后紧跟一个分号，表明循环体是一个分号（空语句）
		while (count < 10);
		// 下面的代码块与while循环已经没有任何关系
		{
			NSLog(@"count: %d" , count);
			count++;
		}
	}
}
