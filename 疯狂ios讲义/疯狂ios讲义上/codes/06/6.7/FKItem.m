//  Created by yeeku on 2013-4-19.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKItem.h"

// 为FKItem提供实现部分
@implementation FKItem
// 重写该方法作为测试
- (id) init
{
	if(self == [super init])
	{
		NSLog(@"init方法中，引用计数为：%ld" , self.retainCount);
	}
	return self;
}
// 重写该方法作为测试
- (void) dealloc
{
	NSLog(@"系统开始销毁我了，再见！");
	[super dealloc];
}
@end
