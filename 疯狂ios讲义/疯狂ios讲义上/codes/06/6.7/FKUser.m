//  Created by yeeku on 2013-4-19.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKUser.h"

// 为FKUser提供实现部分
@implementation FKUser
// 注意这个setter方法还有问题，下面继续将会继续介绍
//- (void) setItem:(FKItem*) item
//{
//	if(_item != item)
//	{
//		// 让item的引用计数加1
//		[item retain];
//		_item = item;
//	}
//}
// 这个setter方法更加安全
- (void) setItem:(FKItem*) item
{
	if(_item != item)
	{
		// 将_item引用的实例变量的引用计数减1
		[_item release];
		// 让item的引用计数加1，并赋给_item实例变量
		_item = [item retain];
	}
}
- (FKItem*) item
{
	return _item;
}
- (void) dealloc
{
	// 让_item的引用计数减1
	[_item release];
	NSLog(@"系统开始销毁FKUser对象");
	[super dealloc];
}
@end