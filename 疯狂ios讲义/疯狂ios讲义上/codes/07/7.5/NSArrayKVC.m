//  Created by yeeku on 2013-4-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKUser.h"
// 定义一个函数，该函数用于把NSArray集合转换为字符串
NSString* NSCollectionToString(NSArray* array)
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
		// 初始化NSArray对象
		NSArray* array = [NSArray arrayWithObjects:
			[[FKUser alloc] initWithName:@"sun" pass:@"123"],
			[[FKUser alloc] initWithName:@"bai" pass:@"345"],
			[[FKUser alloc] initWithName:@"zhu" pass:@"654"],
			[[FKUser alloc] initWithName:@"tang" pass:@"178"],
			[[FKUser alloc] initWithName:@"niu" pass:@"155"],
			nil];
		// 获取所有集合元素的name属性组成的新集合
		id newArr = [array valueForKey:@"name"];
		NSLog(@"%@" , NSCollectionToString(newArr));
		// 对集合中所有元素整体进行KVC编程
		// 将所有集合元素的name属性改为"新名字"
		[array setValue:@"新名字" forKey:@"name"];
		NSLog(@"%@" , NSCollectionToString(array));
	}
}