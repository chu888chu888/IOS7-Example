//  Created by yeeku on 2013-5-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 从myDict.archive文件中恢复对象
		NSDictionary* dict = [NSKeyedUnarchiver
			unarchiveObjectWithFile:@"myDict.archive"];
		// 下面代码只是获取NSDictionary中key-value数据
		NSLog(@"Objective-C对应的value：%@" ,
			[dict valueForKey:@"Objective-C"]);
		NSLog(@"Ruby对应的value：%@" ,
			[dict valueForKey:@"Ruby"]);
		NSLog(@"Python对应的value：%@" ,
			[dict valueForKey:@"Python"]);
		NSLog(@"Perl对应的value：%@" ,
			[dict valueForKey:@"Perl"]);
	}
}
