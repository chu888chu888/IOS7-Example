//  Created by yeeku on 2013-4-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKParent.h"

@implementation FKParent
@synthesize a = _a;
- (id) init
{
	if(self = [super init])
	{
		self->_a = 5;
	}
	return self;
}
@end