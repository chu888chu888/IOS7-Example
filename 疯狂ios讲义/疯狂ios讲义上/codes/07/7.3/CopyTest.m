//  Created by yeeku on 2013-4-20.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		NSMutableString* book = [NSMutableString 
			stringWithString:@"疯狂iOS讲义"];
		// 复制book字符串的可变副本
		NSMutableString* bookCopy = [book mutableCopy];
		// 对副本修改，对原字符串没有任何影响
		[bookCopy replaceCharactersInRange:
			NSMakeRange(2, 3)
			withString:@"Android"];
		// 此处看到原字符串的值并没有改变
		NSLog(@"book的值为:%@" , book);
		// 字符串副本发生了改变。
		NSLog(@"bookCopy的值为:%@" , bookCopy);
		NSString* str = @"fkit";
		// 复制str（不可变字符串）的可变副本
		NSMutableString* strCopy = [str mutableCopy]; //①
		// 向可变字符串后面追加字符串
		[strCopy appendString:@".org"];
		NSLog(@"%@" , strCopy);
		// 调用book（可变字符串）的copy方法，程序返回一个不可修改的副本
		NSMutableString* bookCopy2 = [book copy]; //②
		// 由于bookCopy2是不可修改的，因此下面代码将会出现错误
		[bookCopy2 appendString:@"aa"];	
	}
}