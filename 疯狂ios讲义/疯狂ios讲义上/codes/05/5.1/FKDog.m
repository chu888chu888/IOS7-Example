//  Created by yeeku on 2013-3-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKDog.h"

@implementation FKDog
// 实现一个jump方法
- (void) jump
{
	NSLog(@"正在执行jump方法");
}
// 实现一个run方法，run方法需要借助jump方法
- (void) run
{
//	FKDog* d = [[FKDog alloc] init];
//	[d jump];
	[self jump];
	NSLog(@"正在执行run方法");
}
@end
