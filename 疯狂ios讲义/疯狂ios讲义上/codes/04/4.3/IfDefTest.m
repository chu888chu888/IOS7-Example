//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 定义iPad宏
#define iPad

int main(int argc , char * argv[])
{
	@autoreleasepool{
		#ifdef iPad
			NSLog(@"这是iPad平板");
			NSLog(@"下面执行关于iPad的代码");
		#else
			NSLog(@"这是iPhone手机");
			NSLog(@"下面执行关于iPhone的代码");
		#endif
	}
}
