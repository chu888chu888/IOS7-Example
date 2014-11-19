//  Created by yeeku on 2013-4-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKDog.h"

@implementation FKDog
@synthesize name;
@synthesize age;
//- (id)copyWithZone:(NSZone*)zone
//{
//	NSLog(@"--执行copyWithZone--");
//	// 使用zone参数创建FKDog对象
//	FKDog* dog = [[[self class] allocWithZone:zone] init];
//	dog.name = self.name;
//	dog.age = self.age;
//	return dog;
//}
// 为深复制实现的copyWithZone:方法
- (id)copyWithZone:(NSZone*)zone
{
	NSLog(@"--执行copyWithZone--");
	// 使用zone参数创建FKDog对象
	FKDog* dog = [[[self class] allocWithZone:zone] init];
	// 将原对象的name实例变量复制一份副本后赋值给新对象的name实例变量
	dog.name = [self.name mutableCopy];
	dog.age = self.age;
	return dog;
}
@end