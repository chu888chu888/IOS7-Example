//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKUser.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建FKUser对象
		FKUser* user = [[FKUser alloc] init];
		// 调用setter方法修改user成员变量的值
		[user setName:@"admin"];
		[user setPass:@"1234"];
		[user setBirth:[NSDate date]];
		// 访问user成员变量的值
		NSLog(@"管理员账号为：%@，密码为：%@，生日为：%@"
			, [user name] , [user pass] , [user birth]);
	}
}
