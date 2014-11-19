//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKPerson.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		FKPerson* p = [[FKPerson alloc] init];
		// 因为age成员变量已被隐藏，所以下面语句将出现编译错误。
//		p->_age = 1000;
		// 下面语句编译不会出现错误，但运行时将提示出入的age成员变量不合法
		// 程序不会修改p的age成员变量
		[p setAge: 1000];
		// 访问p的age成员变量也必须通过其对应的getter方法
		// 因为上面从未成功设置p的age成员变量，故此处输出0
		NSLog(@"未能设置age成员变量时：%d" , [p age]);
		// 成功修改p的age成员变量
		[p setAge:30];
		//因为上面成功设置了p的age成员变量，故此处输出30
		NSLog(@"成功设置age成员变量后：%d" , [p age]);
		// 不能直接操作p的name成员变量，只能通过其对应的setter方法
		// 因为"李刚"字符串长度满足2~6,所以可以成功设置
		[p setName:@"李刚"];
		NSLog(@"成功设置name成员变量后：%@" , [p name]);
	}
}
