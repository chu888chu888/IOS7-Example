//  Created by yeeku on 2013-4-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKBase.h"

@implementation FKBase
- (void) base
{
	NSLog(@"父类的普通base方法");
}
- (void) test
{
	NSLog(@"父类的将被覆盖的test方法");
}
@end