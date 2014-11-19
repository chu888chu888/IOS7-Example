//  Created by yeeku on 2013-4-20.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKDog.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建一个FKDog对象
		FKDog* dog1 = [FKDog new];
		dog1.name = [NSMutableString stringWithString:@"旺财"];
		dog1.age = 20;
		// 复制副本
		FKDog* dog2 = [dog1 copy];
		// 复制对象的可变副本
//		FKDog* dog2 = [dog1 mutableCopy];
		dog2.name = [NSMutableString stringWithString:@"snoopy"];
		dog2.age = 12;
		NSLog(@"dog1的名字为：%@" , dog1.name);
		NSLog(@"dog1的年龄为：%d" , dog1.age);
		NSLog(@"dog2的名字为：%@" , dog2.name);
		NSLog(@"dog2的年龄为：%d" , dog2.age);
	}
}