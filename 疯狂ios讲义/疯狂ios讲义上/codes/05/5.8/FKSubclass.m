//  Created by yeeku on 2013-4-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKSubclass.h"

@implementation FKSubclass
- (void) test
{
	NSLog(@"子类的覆盖父类的test方法");
}
- (void) sub
{
	NSLog(@"子类的sub方法");
}
@end