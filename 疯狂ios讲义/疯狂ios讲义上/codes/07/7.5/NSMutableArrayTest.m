//  Created by yeeku on 2013-4-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

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
		// 读取前面写入磁盘的文件，用文件内容来初始化NSMutableArray集合
		NSMutableArray* array = [NSMutableArray
			arrayWithContentsOfFile:@"myFile.txt"];	
		// 向集合最后添加一个元素	
		[array addObject:@"疯狂iOS讲义"];
		NSLog(@"最后追加一个元素后：%@" , NSCollectionToString(array));
		// 使用NSArray向集合尾部添加多个元素
		[array addObjectsFromArray: [NSArray
			 arrayWithObjects:@"张飞" , @"关羽",nil]];
		NSLog(@"最后追加两个元素后：%@" , NSCollectionToString(array));
		// 向集合的指定位置插入一个元素
		[array insertObject:@"疯狂Ajax讲义" atIndex:2];
		NSLog(@"在索引为2处插入一个元素后：%@" 
			, NSCollectionToString(array));
		// 使用NSArray向集合指定位置插入多个元素
		[array insertObjects: [NSArray
			 arrayWithObjects:@"武松" , @"林冲",nil]
			 atIndexes:[NSIndexSet indexSetWithIndexesInRange
			 :NSMakeRange(3,2)]];
		NSLog(@"插入多个元素后：%@" , NSCollectionToString(array));	
		// 删除集合最后一个元素
		[array removeLastObject];
		NSLog(@"删除最后一个元素后：%@" , NSCollectionToString(array));
		// 删除集合中指定索引处的元素
		[array removeObjectAtIndex:5];
		NSLog(@"删除索引为5处的元素后：%@" , NSCollectionToString(array));
		// 删除2~5处元素
		[array removeObjectsInRange:NSMakeRange(2, 3)];
		NSLog(@"删除索引为2~5处的元素后：%@" 
			, NSCollectionToString(array));
		// 替换索引为2处的元素
		[array replaceObjectAtIndex:2 withObject:@"疯狂Android讲义"];
		NSLog(@"替换索引为2处的元素后：%@" 
			, NSCollectionToString(array));
	}
}