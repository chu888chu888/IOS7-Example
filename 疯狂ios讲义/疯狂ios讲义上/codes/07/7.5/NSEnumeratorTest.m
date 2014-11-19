//  Created by yeeku on 2013-4-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 读取前面写入磁盘的文件，用文件内容来初始化NSArray集合
		NSArray* array = [NSArray arrayWithContentsOfFile:
			@"myFile.txt"];		
		// 获取NSArray的顺序枚举器
		NSEnumerator* en = [array objectEnumerator];
		id object;
		while(object = [en nextObject])
		{
			NSLog(@"%@" , object);	
		}
		NSLog(@"------下面逆序遍历------");
		// 获取NSArray的逆序枚举器	
		en = [array reverseObjectEnumerator];
		while(object = [en nextObject])
		{
			NSLog(@"%@" , object);	
		}
	}
}