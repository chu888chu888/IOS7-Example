//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKBook.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		FKBook* book = [[FKBook alloc] init];
		NSMutableString* str = [NSMutableString 
			stringWithString:@"疯狂iOS讲义"];
		// 对book的name属性赋值
		[book setName:str];
		// 输出book的name属性
		NSLog(@"book的name为：%@" , [book name]);
		// 修改str字符串
		[str appendString:@"是一本很好的iOS学习图书"];
		// 下面代码将会看到book的name属性也会被修改
		NSLog(@"book的name为：%@" , [book name]);
	}
}
