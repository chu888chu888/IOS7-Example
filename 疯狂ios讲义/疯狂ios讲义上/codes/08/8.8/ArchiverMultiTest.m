//  Created by yeeku on 2013-5-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKApple.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 直接使用多个value,key的形式创建NSDictionary对象
		NSDictionary* dict = [NSDictionary 
			dictionaryWithObjectsAndKeys:
			[NSNumber numberWithInt:89] , @"Objective-C",
			[NSNumber numberWithInt:69] , @"Ruby",
			[NSNumber numberWithInt:75] , @"Python",
			[NSNumber numberWithInt:109] , @"Perl", nil];
		// 创建一个NSSet对象		
		NSSet* set = [NSSet setWithObjects:
			@"疯狂iOS讲义",
			@"疯狂Android讲义",
			@"疯狂Ajax讲义", nil];
		// 创建FKApple对象
		FKApple* apple = [[FKApple alloc]
			initWithColor:@"红色"
			weight:3.4
			size:20];
		// 创建一个NSMutableData对象，用于保存归档数据
		NSMutableData* data = [NSMutableData data];
		// 以NSMutableData对象作为参数，创建NSKeyedArchiver对象
		NSKeyedArchiver* arch = [[NSKeyedArchiver alloc]
			initForWritingWithMutableData:data];
		// 重复调用encodeObject:forKey:方法归档所有需要归档的对象
		[arch encodeObject:dict forKey:@"myDict"];
		[arch encodeObject:set forKey:@"set"];
		[arch encodeObject:apple forKey:@"myApp"];
		// 结束归档
		[arch finishEncoding];
		// 程序将NSData缓存区保存的数据写入文件
		if([data writeToFile:@"multi.archive" atomically:YES] == NO)
		{
			NSLog(@"归档失败!");
		}
	}
}
