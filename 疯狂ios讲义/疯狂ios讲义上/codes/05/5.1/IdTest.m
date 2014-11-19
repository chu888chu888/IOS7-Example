//  Created by yeeku on 2013-3-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

#import "FKPerson.h"

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 定义id类型的变量，并将FKPerson对象赋给该变量
		id p = [[FKPerson alloc] init];
		// 使用p变量来调用say:方法。
		// 程序将在运行时执行动态绑定，因此实际执行FKPerson对象的say:方法
		[p say: @"你好，疯狂iOS讲义"];
	}
}