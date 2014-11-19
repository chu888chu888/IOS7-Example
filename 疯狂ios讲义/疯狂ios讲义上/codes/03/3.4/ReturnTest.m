//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 一个简单的for循环
		for (int i = 0; i < 3 ; i++ )
		{
			for (int j = 0 ; j < 5 ; j++)
			{
				NSLog(@"i: %d , j: %d" , i , j);
				if (j >= 2)
				{
					return 0;
				}		
			}
		}
		NSLog(@"循环后的语句");
	}
}
