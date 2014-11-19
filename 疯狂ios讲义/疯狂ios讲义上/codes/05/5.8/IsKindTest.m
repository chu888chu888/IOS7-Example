//  Created by yeeku on 2013-4-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKSubclass.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 声明hello时使用NSObject类，则hello的编译时类型是NSObject，
		// NSObject是所有类的父类 , 但hello变量的实际类型是NSString
		NSObject* hello = @"Hello";
		// 使用isKindOfClass判断该变量所指的对象是否为指定类、及其子类的实例
		NSLog(@"字符串是否是NSObject类的实例：%d"
			, ([hello isKindOfClass:[NSObject class]]));
		// 返回true。
		NSLog(@"字符串是否是NSString类的实例：%d"
			, ([hello isKindOfClass:[NSString class]]));
		// 返回false。
		NSLog(@"字符串是否是NSDate类的实例：%d"
			, ([hello isKindOfClass:[NSDate class]]));
		NSString* a = @"Hello";
		// 返回false
		NSLog(@"a是否是NSDate类的实例：%d"
			, ([a isKindOfClass:[NSDate class]]));
	}
}