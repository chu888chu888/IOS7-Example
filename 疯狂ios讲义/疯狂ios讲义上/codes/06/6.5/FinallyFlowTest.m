//  Created by yeeku on 2013-4-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKEatable.h"

BOOL test()
{
	@try
	{
		// 因为finally块中包含了return语句，
		// 所以下面的return语句失去作用
		return YES;
	}
	@finally
	{
		return NO;
	}
}
int main(int argc , char * argv[])
{
	@autoreleasepool{
		BOOL a = test();
		// 输出代表NO的0
		NSLog(@"%d" , a);
	}
}
