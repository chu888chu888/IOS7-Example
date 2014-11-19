//  Created by yeeku on 2013-4-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKDog.h"
#import "FKMyException.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建FKDog对象
		FKDog* dog = [[FKDog alloc] init];
		dog.age = 20;
		NSLog(@"狗的年龄为：%d" , dog.age);
		dog.age = 80;
	}
}