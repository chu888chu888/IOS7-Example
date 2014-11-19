//  Created by yeeku on 2013-5-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKApple.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建一个NSData对象，用于读取指定文件中的归档数据
		NSData* data = [NSData
			dataWithContentsOfFile:@"multi.archive"];
		// 以NSData对象作为参数，创建NSKeyedUnarchiver对象
		NSKeyedUnarchiver* unarch = [[NSKeyedUnarchiver alloc]
			initForReadingWithData:data];
		// 重复调用decodeObjectForKey:方法恢复所有需要恢复的对象
		NSDictionary* dict = [unarch decodeObjectForKey:@"myDict"];
		NSSet* set = [unarch decodeObjectForKey:@"set"];
		FKApple* myApp = [unarch decodeObjectForKey:@"myApp"];
		// 结束恢复
		[unarch finishDecoding];
		// 下面代码仅仅只是验证恢复是否成功
		NSLog(@"%@" , dict);
		NSLog(@"%@" , set);
		NSLog(@"%@" , myApp);
	}
}
