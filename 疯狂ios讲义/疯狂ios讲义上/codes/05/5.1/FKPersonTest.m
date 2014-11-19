//  Created by yeeku on 2013-3-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

#import "FKPerson.h"

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 定义FKPerson*类型的变量
		FKPerson* person;
		// 创建FKPerson对象,赋给person变量
		person = [[FKPerson alloc] init];
		// 调用有参数的方法，必须传入参数
		[person say:@"Hello， I love iOS"];
		[person setName: @"孙悟空" andAge: 500];
		// 调用无参数的方法，不需要传入参数
		// 方法有返回值，可以定义一个类型匹配的变量，来接收返回值
		NSString* info = [person info];
		NSLog(@"person的info信息为：%@" , info);
		// 下面调用test方法将会引起错误。
		// 因为test方法是在实现部分定义的，应该被隐藏
//		[person test];
		// 通过类名来调用类方法
		[FKPerson foo];
		// 将person变量的值赋值给p2变量
		FKPerson* p2 = person;
	}
}