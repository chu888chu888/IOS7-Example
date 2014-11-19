//  Created by yeeku on 2013-4-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 通过字符串来获取Class
		Class clazz = NSClassFromString(@"NSDate");
		NSLog(@"%@" , clazz);
		// 直接使用Class来创建对象
		id date = [[clazz alloc] init];
		NSLog(@"%@" , date);
		// 通过对象来获取Class
		NSLog(@"%@" , [date class]);
		// 通过类来获取class
		NSLog(@"%d" , clazz == NSDate.class);
	}
}