//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 使用typedef定义了块变量类型
		typedef void (^FKPrintBlock)(NSString*);
		// 使用FKPrintBlock定义块变量，并将指定块赋给该变量
		FKPrintBlock print = ^(NSString* info)
		{
			NSLog(@"%@" , info);
		};
		// 使用FKPrintBlock定义块变量，并将指定块赋给该变量
		FKPrintBlock loopPrint = ^(NSString* info)
		{
			for (int i = 0 ; i < 3 ; i ++)
			{
				NSLog(@"%@" , info);
			}
		};
		// 依次调用两个块
		print(@"Objective-C");
		loopPrint(@"iOS");
	}
}