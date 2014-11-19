//  Created by yeeku on 2013-4-22.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 定义一个函数，该函数可把NSArray或NSSet集合转换为字符串
NSString* NSCollectionToString(id collection)
{
	NSMutableString* result = [NSMutableString 
		stringWithString:@"["];
	// 使用快速枚举遍历NSSet集合
	for(id obj in collection)
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
		NSSortedSet* set = [NSSortedSet setWithObjects:
			[Number numberWithInt:40],
			[Number numberWithInt:12],
			[Number numberWithInt:-9],
			[Number numberWithInt:28],
			[Number numberWithInt:17],
			nil];
			
		NSLog(@"%@" , NSCollectionToString(set));

	}
}