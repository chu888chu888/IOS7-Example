//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 调用类方法将int类型的值包装成NSNumber对象
		NSNumber* num = [[NSNumber alloc] initWithInt:20];
		NSLog(@"%@" , [num class]);
		// 调用类方法将double类型的值包装成NSNumber对象
		NSNumber* de = [NSNumber numberWithDouble: 3.4];
		NSLog(@"%d" , [num intValue]);
		NSLog(@"%g" , [de doubleValue]);
		// 先创建NSNumber对象，再调用initWithXxx方法执行初始化
		NSNumber* ch = [[NSNumber alloc] initWithChar:'J'];
		// 直接输出NSNumber对象，使用%@格式字符串
		NSLog(@"%@" , ch);
	}
}
