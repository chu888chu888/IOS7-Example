//  Created by yeeku on 2013-3-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

#import "FKDog.h"

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 创建Dog对象
		FKDog* dog = [[FKDog alloc] init];
		// 调用Dog对象的run方法
		[dog run];
	}
}