//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKUser.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建并初始化FKUser对象
		FKUser* user = [[FKUser alloc] init];
		// 访问FKUser对象的属性
		NSLog(@"user的name为%@" , user.name);
		NSLog(@"user的age为%d" , user.age);
		NSLog(@"user的address为%@" , user.address);
	}
}
