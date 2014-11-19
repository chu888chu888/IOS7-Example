//  Created by yeeku on 2013-4-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 读取前面写入磁盘的文件，用文件内容来初始化NSArray集合
		NSArray* array = [NSArray arrayWithContentsOfFile:
			@"myFile.txt"];	
		for(id object in array)
		{
			NSLog(@"%@" , object);
		}
	}
}