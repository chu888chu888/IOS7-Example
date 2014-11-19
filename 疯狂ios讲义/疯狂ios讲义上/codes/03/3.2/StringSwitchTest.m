//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		//声明变量season
		NSString * season = @"夏天";
		//执行swicth分支语句
		switch (season)
		{
			case "春天": 
				NSLog(@"春暖花开.");
				break;
			case "夏天": 
				NSLog(@"夏日炎炎.");
				break;
			case "秋天": 
				NSLog(@"秋高气爽.");
				break;
			case "冬天": 
				NSLog(@"冬雪皑皑.");
				break;
			default: 
				NSLog(@"季节输入错误");
		}
	}
}
