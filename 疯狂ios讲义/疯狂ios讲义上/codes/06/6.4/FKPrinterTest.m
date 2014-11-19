//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKPrinter.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建FKPrinter对象
		FKPrinter* printer = [[FKPrinter alloc] init];
		// 调用FKPrinter对象的方法
		[printer addData:@"疯狂iOS讲义"];
		[printer addData:@"疯狂XML讲义"];
		[printer output];
		[printer addData:@"疯狂Android讲义"];
		[printer addData:@"疯狂Ajax讲义"];
		[printer output];
		// 创建一个FKPrinter对象，当成FKProductable使用
		NSObject<FKProductable>* p = [[FKPrinter alloc] init];
		// 调用FKProductable协议中定义的方法
		NSLog(@"%@" , p.getProduceTime);
		// 创建一个FKPrinter对象，当成FKOutput使用
		id<FKOutput> out = [[FKPrinter alloc] init];
		// 调用FKOutput协议中定义的方法
		[out addData:@"孙悟空"];
		[out addData:@"猪八戒"];
		[out output];
	}
}
