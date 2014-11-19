//  Created by yeeku on 2013-3-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKPerson.h"

@implementation FKPerson
{
	// 定义一个只能在实现部分使用的成员变量（被隐藏的成员变量）
	int _testAttr;
}

// 下面定义了一个setName: andAge:方法
- (void) setName:(NSString*) n andAge: (int) a // ①
{
	_name = n;
	_age = a;
}
// 下面定义了一个say方法
- (void) say: (NSString *) content
{
	NSLog(@"%@" , content);
}
// 下面定义了一个不带形参的info方法
- (NSString*) info
{
	[self test];
	return [NSString stringWithFormat:
		@"我是一个人，名字为：%@，年龄为%d。" , _name ,_age];
}
// 定义一个只能在实现部分使用的方法（被隐藏的方法）
- (void) test
{
	NSLog(@"--只在实现部分定义的test方法--");
}
// 定义一个类方法
+ (void) foo
{
	NSLog(@"FKPerson类的类方法，通过类名调用");
}
@end
