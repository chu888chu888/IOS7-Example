//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKApple.h"

@implementation FKApple
@synthesize color = _color;
@synthesize weight = _weight;
@synthesize size = _size;
- (id) initWithColor: (NSString*) color 
	weight:(double) weight size:(int) size
{
	if(self = [super init])
	{
		self.color = color;
		self.weight = weight;
		self.size = size;
	}
	return self;
}
// 重写父类的decription方法
- (NSString*) description
{
	// 返回一个字符串
	return [NSString stringWithFormat:
		@"<FKApple[_color=%@, _weight=%g, _size=%d]>"
		, self.color , self.weight , self.size];
}
- (void) encodeWithCoder: (NSCoder*) coder
{
	// 调用NSCoder的方法归档该对象的每个实例变量
	[coder encodeObject:_color forKey:@"color"];
	[coder encodeDouble:_weight forKey:@"weight"];
	[coder encodeInt:_size forKey:@"size"];
}
- (id) initWithCoder: (NSCoder*) coder
{
	// 使用NSCoder依次恢复color、weight、size这3个key
	// 所对应的value，并将恢复的value赋给当前对象的3个实例变量
	_color = [coder decodeObjectForKey:@"color"];
	_weight = [coder decodeDoubleForKey:@"weight"];
	_size = [coder decodeIntForKey:@"size"];
	return self;
}
@end
