//  Created by yeeku on 2013-5-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		NSFileManager* fm = [NSFileManager defaultManager];
		// 创建目录
		[fm createDirectoryAtPath:@"xyz/abc"
			// 该参数指定如果父目录不存在，创建父目录
			withIntermediateDirectories:YES
			attributes:nil 
			error:nil];
		NSString* content = @"《疯狂iOS讲义》是我正在学习的图书！";
		// 创建一份文件
		[fm createFileAtPath:@"myInfo.txt"
			contents:[content dataUsingEncoding:NSUTF8StringEncoding]
			attributes:nil];
		// 复制一份新文件
		[fm copyItemAtPath:@"myInfo.txt"
			toPath:@"copyInfo.txt"
			error:nil];
	}
}
