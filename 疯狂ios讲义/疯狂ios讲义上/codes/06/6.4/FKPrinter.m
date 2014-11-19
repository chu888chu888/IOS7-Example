//  Created by yeeku on 2013-4-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKPrinter.h"
#define MAX_CACHE_LINE 10

// 为FKPrinter提供实现部分
@implementation FKPrinter
{
	// 使用数组记录所有需要缓存的打印数据
 	NSString* printData[MAX_CACHE_LINE];
	// 记录当前需打印的作业数
	int dataNum;
}
- (void) output
{
	//只要还有作业，继续打印
	while(dataNum > 0)
	{
		NSLog(@"打印机使用%@打印：%@" , self.printColor , printData[0]);
		// 将剩下的作业数减1
		dataNum--;
		// 把作业队列整体前移一位
		for(int i = 0 ; i < dataNum ; i++)
		{
			printData[i] = printData[i + 1];
		}
	}
}
- (void) addData: (NSString*) msg
{
	if (dataNum >= MAX_CACHE_LINE)
	{
		NSLog(@"输出队列已满，添加失败");
	}
	else
	{
		// 把打印数据添加到队列里，已保存数据的数量加1。
		printData[dataNum++] = msg;
	}
}
- (NSDate*) getProduceTime;
{
	return [[NSDate alloc] init];
}
- (NSString*) printColor
{
	return @"红色";
}
@end
