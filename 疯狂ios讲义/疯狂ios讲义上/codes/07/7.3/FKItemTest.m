//  Created by yeeku on 2013-4-20.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKItem.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建一个FKItem对象
		FKItem* item = [FKItem new];
		// 对item的name属性赋值
		item.name = [NSMutableString stringWithString:
			@"疯狂iOS讲义"];
		// 为item的name属性后追加一个字符串
		[item.name appendString:@"fkit"];
	}
}