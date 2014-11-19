//  Created by yeeku on 2013-5-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKApple.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 直接使用多个value,key的形式创建NSDictionary对象
		NSDictionary* dict = [NSDictionary 
			dictionaryWithObjectsAndKeys:
			[[FKApple alloc]
				initWithColor:@"红色"
				weight:3.4
				size:20] , @"one",
			[[FKApple alloc]
				initWithColor:@"绿色"
				weight:2.8
				size:14] , @"two", nil];
		// 归档对象，将归档对象的数据写入NSData中
		NSData* data = [NSKeyedArchiver
			archivedDataWithRootObject:dict];
		// 从NSData对象中恢复对象，这样即可完成深复制
		NSDictionary* dictCopy = [NSKeyedUnarchiver
			unarchiveObjectWithData:data];
		// 获取复制的NSDictionary对象中key为one对应的FKApple对象
		FKApple* app = [dictCopy objectForKey:@"one"];
		// 修改该FKApple对象的color。
		[app setColor:@"紫色"];
		// 获取原始的NSDictionary对象中key为one对应的FKApple对象
		FKApple* oneApp = [dict objectForKey:@"one"];
		// 访问该FKApple的颜色，程序将会发现该颜色没有任何改变
		NSLog(@"dict中key为one对应苹果的颜色为：%@" ,
			oneApp.color);
	}
}
