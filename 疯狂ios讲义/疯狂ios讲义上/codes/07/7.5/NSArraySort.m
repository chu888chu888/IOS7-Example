//  Created by yeeku on 2013-4-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 定义比较函数，根据两个对象的intValue进行比较
NSInteger intSort(id num1, id num2, void *context)
{
	int v1 = [num1 intValue];
	int v2 = [num2 intValue];
	if (v1 < v2)
		return NSOrderedAscending;
	else if (v1 > v2)
		return NSOrderedDescending;
	else
		return NSOrderedSame;
}
int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 初始化一个元素为NSString的NSArray对象
		NSArray* array1 = [NSArray arrayWithObjects:
			@"Objective-C" , @"C" , @"C++" 
			, @"Ruby" , @"Perl" , @"Python" , nil];	
		// 使用集合元素的compare:方法执行排序
		array1 = [array1 sortedArrayUsingSelector:
			@selector(compare:)];
		NSLog(@"%@" , array1);
		// 初始化一个元素为NSNumber的NSArray对象
		NSArray* array2 = [NSArray arrayWithObjects:
			[NSNumber numberWithInt:20], 
			[NSNumber numberWithInt:12], 
			[NSNumber numberWithInt:-8], 
			[NSNumber numberWithInt:50], 
			[NSNumber numberWithInt:19], nil];
		// 使用intSort函数执行排序		
		array2 = [array2 sortedArrayUsingFunction:intSort
			context:nil];
		NSLog(@"%@" , array2);
		// 使用代码块对集合元素进行排序
		NSArray* array3 = [array2 sortedArrayUsingComparator:
			^(id obj1, id obj2)
		{
			// 该代码块就是根据集合元素的 intValue进行比较
			if ([obj1 intValue] > [obj2 intValue])
			{
				return NSOrderedDescending;
			}
			if ([obj1 intValue] < [obj2 intValue]) 
			{
				return NSOrderedAscending;
			}
			return NSOrderedSame;
		}];	
		NSLog(@"%@" , array3);
	}
}