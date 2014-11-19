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
		// 修改dog2的name属性值
		[dog2.name replaceCharactersInRange:
			NSMakeRange(0 , 2)
			withString:@"snoopy"];
		// 查看dog2、dog1的name属性值
		NSLog(@"dog2的name为:%@" , dog2.name);
		NSLog(@"dog1的name为:%@" , dog1.name);
	}
}