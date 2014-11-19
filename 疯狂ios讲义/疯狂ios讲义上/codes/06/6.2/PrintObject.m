//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKPerson.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建一个FKPerson对象，将之赋给p变量
		FKPerson* p = [[FKPerson alloc] initWithName:@"孙悟空"];
		// 打印p指向的FKPerson对象
		NSLog(@"%p" , p);
	}
}
