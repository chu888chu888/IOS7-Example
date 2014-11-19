//  Created by yeeku on 2013-5-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		NSFileManager* fm = [NSFileManager defaultManager];
		// 获取指定目录下所有文件和文件夹
		NSArray * array = [fm contentsOfDirectoryAtPath:@"."
			error:nil];
		for(NSString* item in array)
		{
			NSLog(@"%@" , item);
		}
		// 获取指定目录下所有文件和文件夹对应的枚举器
		NSDirectoryEnumerator* dirEnum =
    		[fm enumeratorAtPath:@"."];
		NSString *file;
		// 枚举dirEnum中包含的每个文件
		while ((file = [dirEnum nextObject])) 
		{
			// 如果该文件的文件名以.m结尾
		    if ([[file pathExtension] isEqualToString: @"m"]) {
				// 直接获取文件内容
				NSData* data = [fm contentsAtPath:file];
				// 直接将NSData的数据用UTF-8的格式转换字符串
				NSString* content = [[NSString alloc] initWithData:data 
					encoding:NSUTF8StringEncoding];
				NSLog(@"----------输出文件内容---------");
				NSLog(@"%@" , content);
		    }
		}
		// 获取当前目录下的所有子目录
//		NSArray* subArr = [fm subpathsOfDirectoryAtPath:@"." 
//			error:nil];
		NSArray* subArr = [fm subpathsAtPath:@"."];
		for(NSString* item in subArr)
		{
			NSLog(@"%@" , item);
		}
	}
}
