//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 声明变量score，并为其赋值为'C'
		char score = 'C';
		// 执行swicth分支语句
		switch (score)
		{
			case 'A': 
				NSLog(@"优秀.");
				break;
			case 'B': 
				NSLog(@"良好.");
				break;
			case 'C': 
				NSLog(@"中");
				break;
			case 'D': 
				NSLog(@"及格");
				break;
			case 'F': 
				NSLog(@"不及格");
				break;
			default: 
				NSLog(@"成绩输入错误");
		}

	}
}
