//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 外层循环
		for (int i = 0 ; i < 5 ; i++ )
		{
			// 内层循环
			for (int j = 0; j < 3 ; j++ )
			{
				NSLog(@"i的值为: %d, j的值为: %d" , i , j);
				if (j >= 1)
				{
					//跳到outer标签处。
					goto  outer;
				}
			}
			// 标签后的分号代表一条空语句
			outer: ;
		}
		NSLog(@"循环结束"); 
	}
}
