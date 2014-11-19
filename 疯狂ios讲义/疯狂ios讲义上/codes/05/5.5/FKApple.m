//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKApple.h"

@implementation FKApple
- (void) setValue:(id)value forUndefinedKey:(id)key
{
	NSLog(@"您尝试设置的key:【%@】并不存在！", key);
	NSLog(@"您尝试设置的value为:%@", value);
}
- (void) valueForUndefinedKey:(id)key
{
	NSLog(@"您尝试访问的key:【%@】并不存在！", key);
}
@end