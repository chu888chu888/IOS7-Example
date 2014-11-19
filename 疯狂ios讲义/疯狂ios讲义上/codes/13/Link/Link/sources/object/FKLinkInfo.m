//
//  FKLinkInfo.m
//  Link
//
//  Created by yeeku on 13-7-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKLinkInfo.h"

@implementation FKLinkInfo
// 提供第一个初始化方法, 表示两个FKPoint可以直接相连, 没有转折点
- (id)initWithP1:(FKPoint*)p1 p2:(FKPoint*)p2
{
	self = [super init];
	if (self) {
		_points = [[NSMutableArray alloc] init];
		[_points addObject:p1];
		[_points addObject:p2];
	}
	return self;
}
// 提供第二个初始化方法, 表示三个FKPoint可以相连, p2是p1与p3之间的转折点
- (id)initWithP1:(FKPoint*)p1 p2:(FKPoint*)p2 p3:(FKPoint*)p3
{
	self = [super init];
	if (self) {
		_points = [[NSMutableArray alloc] init];
		[_points addObject:p1];
		[_points addObject:p2];
		[_points addObject:p3];
	}
	return self;
}
// 提供第三个初始化方法, 表示四个FKPoint可以相连, p2, p3是p1与p4的转折点
- (id)initWithP1:(FKPoint*)p1 p2:(FKPoint*)p2 p3:(FKPoint*)p3 p4:(FKPoint*)p4
{
	self = [super init];
	if (self) {
		_points = [[NSMutableArray alloc] init];
		[_points addObject:p1];
		[_points addObject:p2];
		[_points addObject:p3];
		[_points addObject:p4];
	}
	return self;
}
@end
