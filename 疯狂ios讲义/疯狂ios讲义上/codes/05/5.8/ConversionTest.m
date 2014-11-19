//  Created by yeeku on 2013-4-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKSubclass.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		NSObject* obj = @"Hello";
		// 由于obj变量所指向的对象是NSString对象，所以运行时也可通过
		NSString* objStr = (NSString*)obj;
		NSLog(@"%@" , objStr);
		// 定义一个obj2变量，编译类型为NSObject，实际类型为NSString
		NSObject* obj2 = @"iOS";
		// 尝试将obj2强转为NSDate，这行代码没有任何问题
		// 但程序只是定义一个NSDate类型的指针，该指针与obj2指向同一个对象
		NSDate* date = (NSDate*)obj2;
		// 程序调用date的isEqualToDate:方法。
		// 由于date的编译时类型是NSDate，因此编译时没有任何问题
		// 由于date实际指向的对象是NSString，因此程序执行时就会引发错误，
		NSLog(@"%d" , [date isEqualToDate:[NSDate date]]);
	}
}