//  Created by yeeku on 2013-4-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKUser.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建谓词，要求name的以s开头
		NSPredicate* pred = [NSPredicate predicateWithFormat:
			@"name like 's*'"];
		FKUser* user1 = [[FKUser alloc] initWithName:@"sun"
			pass:@"123"];
		// 对user1对象使用谓词执行判断。
		BOOL result1 = [pred evaluateWithObject:user1];
		NSLog(@"user1的name是否以s开头：%d", result1);
		FKUser* user2 = [[FKUser alloc] initWithName:@"bai"
			pass:@"563"];
		// 对user1对象使用谓词执行判断。				
		BOOL result2 = [pred evaluateWithObject:user2];
		NSLog(@"user2的name是否以s开头：%d", result2);
	}
}