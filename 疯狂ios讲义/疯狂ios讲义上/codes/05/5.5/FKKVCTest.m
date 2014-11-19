//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKUser.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建FKUser对象
		FKUser* user = [[FKUser alloc] init];
		// 使用KVC方式为name属性设置属性值
		[user setValue:@"孙悟空" forKey:@"name"];
		// 使用KVC方式为pass属性设置属性值
		[user setValue:@"1455" forKey:@"pass"];
		// 使用KVC方式为birth属性设置属性值
		[user setValue:[[NSDate alloc]init] forKey:@"birth"];
		// 使用KVC获取FKUser对象的属性
		NSLog(@"user的name为：%@" , [user valueForKey:@"name"]);
		NSLog(@"user的pass为：%@" , [user valueForKey:@"pass"]);
		NSLog(@"user的birth为：%@" , [user valueForKey:@"birth"]);
	}
}
