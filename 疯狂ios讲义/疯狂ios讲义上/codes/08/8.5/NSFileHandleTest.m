//  Created by yeeku on 2013-5-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 打开一份文件准备读取
		NSFileHandle* fh = [NSFileHandle
			fileHandleForReadingAtPath:@"NSFileHandleTest.m"];
		NSData* data;		
		// 读取NSFileHandle中的256个字节
		while( [(data = [fh readDataOfLength:512]) length] > 0 )
		{
			NSLog(@"%ld" , [data length]);
			// 直接将NSData的数据用UTF-8的格式转换字符串
			NSString* content = [[NSString alloc] initWithData:data 
				encoding:NSUTF8StringEncoding];
			NSLog(@"----------输出读取的512个字节的内容---------");
			NSLog(@"%@" , content);
		}

		// 关闭文件
		[fh closeFile];		
		// 打开一份文件准备写入
		NSFileHandle* fh2 = [NSFileHandle
			fileHandleForWritingAtPath:@"abc.txt"];
		if(!fh2)
		{
			// 创建一个NSFileManager对象
			NSFileManager* fm = [NSFileManager defaultManager];
			// 创建一份空的文件
			[fm createFileAtPath:@"abc.txt"
				contents:nil
				attributes:nil];
			fh2 = [NSFileHandle
				fileHandleForWritingAtPath:@"abc.txt"];
		}
		NSString* myBook = @"疯狂iOS讲义";
		// 将指定内容写入底层文件
		[fh2 writeData:[myBook 
			dataUsingEncoding:NSUTF8StringEncoding]];
		// 关闭文件
		[fh2 closeFile];
	}
}
