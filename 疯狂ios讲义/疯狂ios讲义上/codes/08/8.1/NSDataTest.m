//  Created by yeeku on 2013-4-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 使用NSData读取指定URL对应的数据
		NSData* data = [NSData dataWithContentsOfURL:
			[NSURL URLWithString:@"http://www.crazyit.org/ethos.php"]];
		NSLog(@"%ld" , [data length]);
		// 定义一个长度为100的数组
		char buffer[100];
		// 将NSData指定范围的数据读入数组
		[data getBytes:buffer range: NSMakeRange(103, 100)];
		// 输出数组的内容
		NSLog(@"%s" , buffer);
		// 直接将NSData的数据用UTF-8的格式转换字符串
		NSString* content = [[NSString alloc] initWithData:data 
			encoding:NSUTF8StringEncoding];
		NSLog(@"----------输出网页内容---------");
		NSLog(@"%@" , content);
	}
}
