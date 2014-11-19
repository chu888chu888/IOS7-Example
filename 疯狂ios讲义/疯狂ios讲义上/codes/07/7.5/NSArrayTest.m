//  Created by yeeku on 2013-4-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		NSArray* array = [NSArray arrayWithObjects:
			@"疯狂iOS讲义", @"疯狂Android讲义" 
			, @"疯狂Ajax讲义", @"疯狂XML讲义"
			, @"Struts 2.x权威指南" , nil];
		NSLog(@"第一个元素：%@" , [array objectAtIndex:0]);
		NSLog(@"索引为1的元素：%@" , [array objectAtIndex:1]);
		NSLog(@"最后一个元素：%@" , [array lastObject]);
		// 获取索引从2~5的元素组成的新集合
		NSArray* arr1 = [array objectsAtIndexes: [NSIndexSet 
			indexSetWithIndexesInRange:NSMakeRange(2, 3)]];
		NSLog(@"%@" , arr1);
		// 获取元素在集合中的位置
		NSLog(@"疯狂Android讲义的位置为：%ld" , 
			[array indexOfObject:@"疯狂Android讲义"]);
		// 获取元素在集合的指定范围中的位置
		NSLog(@"在2~5范围疯狂Android讲义的位置为：%ld" , 
			[array indexOfObject:@"疯狂Android讲义"
			inRange:NSMakeRange(2, 3)]);  // ①
		// 向数组的最后追加一个元素。
		// 原NSArray本身并没有改变，只是将新返回的NSArray赋给array
		array = [array arrayByAddingObject:@"孙悟空"];
		// 向array数组的最后追加另一个数组的所有元素。
		// 原NSArray本身并没有改变，只是将新返回的NSArray赋给array
		array = [array arrayByAddingObjectsFromArray:
			[NSArray arrayWithObjects:@"宝玉" , @"黛玉" , nil]];
		for (int i = 0 ; i < array.count; i++)
		{
//			NSLog(@"%@" , [array objectAtIndex:i]);
			// 上面代码也可简写为如下代码
			NSLog(@"%@" , array[i]);
				
		}
		// 获取array数组中索引为5~8处的所有元素
		NSArray* arr2 = [array subarrayWithRange: NSMakeRange(5, 3)];
		// 将NSArray集合的元素写入文件
		[arr2 writeToFile:@"myFile.txt" atomically:YES];
	}
}