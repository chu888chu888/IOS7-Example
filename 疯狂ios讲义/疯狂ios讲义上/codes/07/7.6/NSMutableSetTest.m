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
		// 创建一个初始容量为10的Set集合
		NSMutableSet* set = [NSMutableSet setWithCapacity:10];
		[set addObject:@"疯狂iOS讲义"];
		NSLog(@"添加1个元素后：%@" , NSCollectionToString(set));
		[set addObjectsFromArray: [NSArray
			arrayWithObjects:@"疯狂Android讲义"
			, @"疯狂Ajax讲义" , @"疯狂XML讲义" ,nil]];
		NSLog(@"使用NSArray添加3个元素后：%@" , NSCollectionToString(set));
		[set removeObject:@"疯狂XML讲义"];
		NSLog(@"删除1个元素后：%@" , NSCollectionToString(set));
		// 再次创建一个Set集合
		NSSet* set2 = [NSSet setWithObjects:
			@"孙悟空", @"疯狂iOS讲义" , nil];
		// 计算两个集合的并集，直接改变set集合的元素
		[set unionSet: set2];
		// 计算两个集合的差集，直接改变set集合的元素
//		[set minusSet: set2];
		// 计算两个集合的交集，直接改变set集合的元素
//		[set intersectSet: set2];
		// 用set2的集合元素替换set的集合元素，直接改变set集合的元素	
//		[set setSet: set2];
		NSLog(@"%@" , NSCollectionToString(set));
	}
}