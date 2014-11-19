//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKPerson.h"

@implementation FKPerson
@synthesize name = _name;
- (id) initWithName: (NSString*) name
{
	if(self = [super init])
	{
		self.name = name;
	}
	return self;
}
- (void) info
{
	NSLog(@"此人名为：%@" , self.name);
}
@end
