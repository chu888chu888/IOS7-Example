//  Created by yeeku on 2013-3-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

@interface FKPerson : NSObject
{
	// 下面定义了两个成员变量
	NSString* _name;
	int _age;
}

// 下面定义了一个setName: andAge:方法
- (void) setName:(NSString*) name andAge: (int) age;
// 下面定义了一个say:方法， 并不提供实现
- (void) say: (NSString *) content;
// 下面定义了一个不带形参的info方法
- (NSString*) info;
// 定义一个类方法
+ (void) foo;
@end
