//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		for(int i = 0 ; i < 10 ; i++)
		{
			#ifdef DEBUG
				NSLog(@"调试输出：i的值为，%d" , i);
			#endif
		}
	}
}
