//  Created by yeeku on 2013-4-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKItem.h"

// 为FKItem提供实现部分
@implementation FKItem
@synthesize price;
// 实现接口部分定义的方法
- (void) info
{
	NSLog(@"这是一个普通的方法");
}
// 额外新增的方法
- (double) calDiscount:(double) discount
{
	return self.price * discount;
}
@end
