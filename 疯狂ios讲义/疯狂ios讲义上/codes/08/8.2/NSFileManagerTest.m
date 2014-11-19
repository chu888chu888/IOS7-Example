//  Created by yeeku on 2013-5-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		NSFileManager* fm = [NSFileManager defaultManager];
		// 将会输出代表真的1
		NSLog(@"NSFileManagerTest.m是否存在：%d", 
			[fm fileExistsAtPath:@"NSFileManagerTest.m"]);
		BOOL isDir;
		NSLog(@"NSFileManagerTest.m是否存在：%d", 
			[fm fileExistsAtPath:@"NSFileManagerTest.m"
			isDirectory: &isDir]);
		// 将会输出代表假的0
		NSLog(@"NSFileManagerTest.m是否为目录：%d", isDir);
		// 将会输出代表真的1
		NSLog(@"NSFileManagerTest.m是否为可读文件：%d", 
			[fm isReadableFileAtPath:@"NSFileManagerTest.m"]);
		// 将会输出代表真的1
		NSLog(@"NSFileManagerTest.m是否为可写文件：%d", 
			[fm isWritableFileAtPath:@"NSFileManagerTest.m"]);
		// 将会输出代表假的0
		NSLog(@"NSFileManagerTest.m是否为可执行文件：%d", 
			[fm isExecutableFileAtPath:@"NSFileManagerTest.m"]);
		// 将会输出代表真的1
		NSLog(@"NSFileManagerTest.m是否为可删除文件：%d", 
			[fm isDeletableFileAtPath:@"NSFileManagerTest.m"]);	
		// 获取NSFileManagerTest.m文件所在的路径组件
		NSArray* array = [fm componentsToDisplayForPath:
			@"NSFileManagerTest.m"];
		NSLog(@"--NSFileManagerTest.m所在路径的完整路径组件为：--");
		for(NSObject* ele in array)
		{
			NSLog(@"%@ , " , ele);
		}
		// 获取文件的相关属性
		NSDictionary* attr = [fm attributesOfItemAtPath:@"NSFileManagerTest.m"
			error:nil];
		// 获取文件属性的详情
		NSLog(@"NSFileManagerTest.m的创建时间为：%@",
			[attr fileCreationDate]);
		NSLog(@"NSFileManagerTest.m的属主账户为：%@",
			[attr fileOwnerAccountName]);
		NSLog(@"NSFileManagerTest.m的文件大小为：%lld",
			[attr fileSize]);
		// 直接获取文件内容
		NSData* data = [fm contentsAtPath:@"NSFileManagerTest.m"];
		// 直接将NSData的数据用UTF-8的格式转换字符串
		NSString* content = [[NSString alloc] initWithData:data 
			encoding:NSUTF8StringEncoding];
		NSLog(@"----------输出文件内容---------");
		NSLog(@"%@" , content);
	}
}
