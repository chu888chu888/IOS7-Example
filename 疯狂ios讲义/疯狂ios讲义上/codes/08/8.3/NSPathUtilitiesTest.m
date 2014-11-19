//  Created by yeeku on 2013-5-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		NSLog(@"当前用户名为：%@" , NSUserName());
		NSLog(@"当前用户的完整用户名为：%@" , NSFullUserName());
		NSLog(@"当前用户的home目录为：%@" , NSHomeDirectory());
		NSLog(@"root用户的home目录为：%@" , 
			NSHomeDirectoryForUser(@"root"));
		NSLog(@"系统临时目录为：%@" , 
			NSTemporaryDirectory());
		NSString* path = @"~root";
		// 将~root解析成root用户的home目录
		NSLog(@"解析~root的结果：%@" ,
			[path stringByExpandingTildeInPath]);
		NSString* path2 = @"/Users/yeeku/publish";
		// 将会输出~/publish
		NSLog(@"替换成~的形式：%@" ,
			[path2 stringByAbbreviatingWithTildeInPath]);
		NSArray* array = [path2 pathComponents];
		// 遍历该路径中包含的各路径组件
		for(NSString* item in array)
		{
			NSLog(@"%@" , item);
		}
		// 在path2路径后追加一个路径
		NSString* path3 = [path2 stringByAppendingPathComponent:@"abc.m"];
		NSLog(@"path3为：%@" , path3); 
		// 获取路径的最后部分
		NSString* last = [path3 lastPathComponent];
		NSLog(@"path3的最后一个路径组件为：%@" , last);
		// 获取路径的最后部分的扩展名
		NSLog(@"path3的最后一个路径的扩展名为：%@" , 
			[path3 pathExtension]);		
	}
}
