//  Created by yeeku on 2013-5-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

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
		// 对dict对象进行归档		
		[NSKeyedArchiver archiveRootObject:dict
			toFile:@"myDict.archive"];
	}
}
