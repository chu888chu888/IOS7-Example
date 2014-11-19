//  Created by yeeku on 2013-4-6.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKSingleton.h"

static id instance = nil;
@implementation FKSingleton
+ (id) instance
{
	// 如果instance为nil
	if(!instance)
	{
		// 创建一个Singleton实例，并将该实例赋给instance全局变量
		instance = [[super alloc] init];
	}
	return instance;
}
@end
int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 判断两次获取的实例是否相等，程序将会返回1（代表真）
		NSLog(@"%d" , 
			[FKSingleton instance] == [FKSingleton instance]);
	}
}
