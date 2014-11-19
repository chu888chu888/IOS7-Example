//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKItem.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建FKItem对象
		FKItem* item = [[FKItem alloc] init];
		// 使用KVC方式尝试为name、price设置属性值为nil
		[item setValue:nil forKey:@"name"];
		[item setValue:nil forKey:@"price"];
		NSLog(@"item的name为：%@", [item valueForKey:@"name"]);
		NSLog(@"item的price为：%@", [item valueForKey:@"price"]);
	}
}
