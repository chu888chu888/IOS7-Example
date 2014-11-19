//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

#define AGE 25

int main(int argc , char * argv[])
{
	@autoreleasepool{
		#if AGE > 60
			NSLog(@"老年人");
		#elif AGE > 40
			NSLog(@"中年人");
		#elif AGE > 20
			NSLog(@"青年人");
		#else
			NSLog(@"少年人");
		#endif								
	}
}
