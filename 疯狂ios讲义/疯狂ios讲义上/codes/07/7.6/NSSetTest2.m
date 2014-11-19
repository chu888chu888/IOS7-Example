//  Created by yeeku on 2013-4-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKUser.h"

// 定义一个函数，该函数可把NSArray或NSSet集合转换为字符串
NSString* NSCollectionToString(id array)
{
	NSMutableString* result = [NSMutableString 
		stringWithString:@"["];
	for(id obj in array)
	{
		[result appendString:[obj description]];
		[result appendString:@", "];
	}
	// 获取字符串长度
	NSUInteger len = [result length];
	// 去掉字符串最后的两个字符
	[result deleteCharactersInRange:NSMakeRange(len - 2, 2)];
	[result appendString:@"]"];
	return result;
}
int main(int argc , char * argv[])
{
	@autoreleasepool{
		NSSet* set = [NSSet setWithObjects:
			[[FKUser alloc] initWithName:@"sun" pass:@"123"],
			[[FKUser alloc] initWithName:@"bai" pass:@"345"],
			[[FKUser alloc] initWithName:@"sun" pass:@"123"],
			[[FKUser alloc] initWithName:@"tang" pass:@"178"],
			[[FKUser alloc] initWithName:@"niu" pass:@"155"],
			nil];
		NSLog(@"set集合元素的个数：%ld" , [set count]);	
		NSLog(@"%@" , NSCollectionToString(set));	
	}
}