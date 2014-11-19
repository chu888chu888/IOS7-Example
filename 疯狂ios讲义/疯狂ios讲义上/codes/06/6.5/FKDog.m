//  Created by yeeku on 2013-4-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKDog.h"
#import "FKMyException.h"

// 为FKDog提供实现部分
@implementation FKDog
@synthesize age = _age;
- (void) setAge:(int)age
{
	if(self.age != age)
	{
		// 检查年龄是否在0～50之间
		if(age > 50 || age < 0)
		{
			// 手动抛出异常
			@throw [[FKMyException alloc] 
				initWithName:@"IllegalArgumentException"
				reason:@"狗的年龄必须在0～50之间"
				userInfo:nil];
		}
		_age = age;
	}
}
@end
