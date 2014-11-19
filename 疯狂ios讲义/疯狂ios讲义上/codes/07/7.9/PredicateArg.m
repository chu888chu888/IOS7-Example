//  Created by yeeku on 2013-4-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKUser.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
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
				 pass:@"598"], nil];
		NSString* propPath = @"name";
		NSString* value = @"大王";
		// 创建谓词，该谓词中包含了2个占位符
		// 后面的2个变量用于为占位符设置参数值
		NSPredicate* pred = [NSPredicate predicateWithFormat:
			@"%K CONTAINS %@" , propPath , value];
		// 执行过滤，过滤后集合只剩下两个元素
		NSSet* newSet = [set filteredSetUsingPredicate:pred];
		NSLog(@"%@" , newSet);
		// 创建谓词，该谓词表达式中使用%K占位符，该占位符使用pass代替
		// 要求被比较对象的pass包含$SUBSTR子串。
		NSPredicate* predTemplate = [NSPredicate predicateWithFormat:
			@"%K CONTAINS $SUBSTR" , @"pass"];
		// 使用NDDictionary指定SUBSTR的值为'43'
		NSPredicate* pred1 = [predTemplate 
			predicateWithSubstitutionVariables:
			[NSDictionary dictionaryWithObjectsAndKeys:
				@"43" , @"SUBSTR", nil]];
		// 执行过滤，过滤后集合只剩下两个元素
		NSSet* newSet1 = [set filteredSetUsingPredicate:pred1];
		NSLog(@"%@" , newSet1);	
		// 使用NDDictionary指定SUBSTR的值为'59'
		NSPredicate* pred2 = [predTemplate 
			predicateWithSubstitutionVariables:
			[NSDictionary dictionaryWithObjectsAndKeys:
				@"59" , @"SUBSTR", nil]];
		// 执行过滤，过滤后集合只剩下两个元素
		NSSet* newSet2 = [set filteredSetUsingPredicate:pred2];
		NSLog(@"%@" , newSet2);
	}
}