//  Created by yeeku on 2013-4-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKUser.h"

@implementation FKUser
@synthesize name;
@synthesize age;
@synthesize address;
// 重写init方法，完成自定义初始化
- (id) init
{
	// 调用父类的init方法执行初始化，将初始化得到的对象赋值给self对象
	// 如果self不为nil，表明父类init方法初始化成功
	if(self = [super init])
	{
		// 对该对象的name、age、address赋初始值
		self.name = @"孙悟空";
		self.age = 500;
		self.address = @"花果山，水帘洞";
	}
	return self;
}
@end