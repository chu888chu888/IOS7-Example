//  Created by yeeku on 2013-4-20.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		NSString* book = @"《疯狂iOS讲义》";
		// 创建一个NSMutableString对象
		NSMutableString* str = [NSMutableString 
			stringWithString:@"Hello"];
		// 追加固定字符串
		// 字符串所包含的字符序列本身发生了改变，因此无需重新赋值
		[str appendString:@",iOS!"];
		NSLog(@"%@" , str);
		// 追加带变量的字符串
		// 字符串所包含的字符序列本身发生了改变，因此无需重新赋值
		[str appendFormat:@"%@是一本非常不错的图书." , book];
		NSLog(@"%@" , str);
		// 在指定位置插入字符串
		// 字符串所包含的字符序列本身发生了改变，因此无需重新赋值
		[str insertString:@"fkit.org" atIndex:6];
		NSLog(@"%@" , str);
		// 删除从位置6到位置12的所有字符
		[str deleteCharactersInRange:NSMakeRange(6, 12)];
		NSLog(@"%@" , str);
		// 将从位置6到位置9的字符串替换成Objective-C
		[str replaceCharactersInRange:NSMakeRange(6, 9)
			withString:@"Objetive-C"];
		NSLog(@"%@" , str);
	}
}