//  Created by yeeku on 2013-4-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKSub.h"

@implementation FKSub
{
	// 该成员变量将会隐藏父类的成员变量
	int _a;
}
- (id) init
{
	if(self = [super init])
	{
		self->_a = 7;
	}
	return self;
}
- (void) accessOwner
{
	// 直接访问的是当前类中的成员变量
	NSLog(@"子类中_a成员变量：%d" , _a);
	// 访问父类中被隐藏的成员变量
	NSLog(@"父类中被隐藏的_a成员变量：%d" , super.a);
}
@end

int main(int argc , char * argv[])
{
	@autoreleasepool{
		FKSub* sub = [[FKSub alloc] init];
		[sub accessOwner];
	}
}