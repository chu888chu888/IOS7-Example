//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKApple.h"

@implementation FKApple
@synthesize color = _color;
@synthesize weight = _weight;
- (id) initWithColor: (NSString*) color weight:(double) weight
{
	if(self = [super init])
	{
		self.color = color;
		self.weight = weight;
	}
	return self;
}
// 重写父类的decription方法
- (NSString*) description
{
	// 返回一个字符串
	return [NSString stringWithFormat:@"<FKApple[_color=%@, _weight=%g]>"
		, self.color , self.weight];
}
@end
