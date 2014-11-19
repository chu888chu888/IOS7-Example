//  Created by yeeku on 2013-4-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKOstrich.h"

@implementation FKOstrich
// 重写父类的fly方法
- (void) fly
{
	NSLog(@"我只能在地上奔跑...");
}
- (void) callOverridedMethod
{
	// 在子类方法中通过super显式调用父类被覆盖的实例方法。
	[super fly];
}
@end