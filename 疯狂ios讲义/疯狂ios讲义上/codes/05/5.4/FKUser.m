//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKUser.h"

@implementation FKUser
// 为3个property合成setter和getter方法，
// 指定name property底层对应的成员变量名为_name
@synthesize name = _name;
@synthesize pass;
@synthesize birth;
// 实现自定义的setName:方法，添加自己的控制逻辑
- (void) setName:(NSString*) name
{
	self->_name = [NSString stringWithFormat:@"+++%@"
		 , name];
}
@end