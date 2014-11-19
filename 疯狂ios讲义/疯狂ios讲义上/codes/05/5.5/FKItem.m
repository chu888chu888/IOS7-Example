//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKItem.h"

@implementation FKItem
@synthesize name;
@synthesize price;
- (void)setNilValueForKey: (id)key
{
	// 如果尝试将key为price的属性设为nil
	if([key isEqualToString:@"price"])
	{
		// 将该price设置为0
		price = 0;
	}
	else
	{
		// 回调父类的setNilValueForKey，执行默认行为
		[super setNilValueForKey: key];
	}
}
@end