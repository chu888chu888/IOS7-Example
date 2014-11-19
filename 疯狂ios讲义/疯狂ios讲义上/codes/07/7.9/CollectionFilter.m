//  Created by yeeku on 2013-4-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKUser.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		NSMutableArray* array = [NSMutableArray
			arrayWithObjects: [NSNumber numberWithInt:50],
			[NSNumber numberWithInt:50],
			[NSNumber numberWithInt:42],
			[NSNumber numberWithInt:20],
			[NSNumber numberWithInt:64],
			[NSNumber numberWithInt:56],nil];
		// 创建谓词，要求该对象自身的值大于50
		NSPredicate* pred1 = [NSPredicate predicateWithFormat:
			@"SELF > 50"];
		// 使用谓词执行过滤，过滤后只剩下值大于50的集合元素
		[array filterUsingPredicate:pred1];
		NSLog(@"值大于50的元素：%@" , array);
		NSSet* set = [NSSet setWithObjects:
			[[FKUser alloc] initWithName:@"孙悟空"
				 pass:@"343"],
			[[FKUser alloc] initWithName:@"金角大王"
				 pass:@"231"],
			[[FKUser alloc] initWithName:@"猪八戒"
				 pass:@"659"],
			[[FKUser alloc] initWithName:@"太上老君"
				 pass:@"743"],
			[[FKUser alloc] initWithName:@"银角大王"
				 pass:@"985"], nil];
		// 创建谓词，要求该对象的name值中包含'大王'
		NSPredicate* pred2 = [NSPredicate predicateWithFormat:
			@"name CONTAINS '大王'"];	
		// 执行过滤，过滤后集合只剩下两个元素				
		NSSet* newSet = [set filteredSetUsingPredicate:pred2];
		NSLog(@"%@" , newSet);																
	}
}