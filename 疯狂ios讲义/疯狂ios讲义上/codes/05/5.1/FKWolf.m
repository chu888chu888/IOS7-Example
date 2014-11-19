//  Created by yeeku on 2013-3-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKWolf.h"

@implementation FKWolf
// 定义一个setName:ageAge方法
- (void) setName: (NSString*) _name andAge: (int) _age
{
	// 当局部变量隐藏成员变量时，
	// 可用self代表调用该方法的对象，这样即可为调用该方法的成员变量赋值了。
	self->_name = _name;
	self->_age = _age;
}
// 定义一个info方法
- (void) info
{
	NSLog(@"我的名字是%@, 年龄是%d岁" , _name , _age);
}
@end

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		FKWolf* w = [[FKWolf alloc] init];
		[w setName: @"灰太狼" andAge:8];
		[w info];
	}
}