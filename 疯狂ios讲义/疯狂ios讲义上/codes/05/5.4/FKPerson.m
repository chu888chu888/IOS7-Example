//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKPerson.h"

@implementation FKPerson
// 提供方法来设置_name成员变量
- (void) setName: (NSString*) name
{
	//执行合理性校验，要求用户名必须在2～6位之间
	if ([name length] > 6 || [name length] < 2)
	{
		NSLog(@"您设置的人名不符合要求");
		return;
	}
	else
	{
		_name = name;
	}
}
// 提供方法来获取_name成员变量的值
- (NSString*) name
{
	return _name;
}
// 提供方法来设置age成员变量
- (void) setAge:(int) age
{
	if(_age != age)
	{
		//执行合理性校验，要求用户年龄必须在0～100之间
		if (age > 100 || age < 0)
		{
			NSLog(@"您设置的年龄不合法");
			return;
		}
		else
		{
			_age = age;
		}
	}
}
// 提供方法来获取_age成员变量的值
- (int) age
{
	return _age;
}
@end