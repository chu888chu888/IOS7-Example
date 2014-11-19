//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKApple.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建一个FKPerson对象，将之赋给p变量
		FKApple* a = [[FKApple alloc] initWithColor:@"红色"
			weight:5.68];
		// 打印FKApple对象
		NSLog(@"%@" , a);
	}
}
