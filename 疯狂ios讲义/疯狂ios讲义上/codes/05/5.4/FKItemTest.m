//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKItem.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		FKItem* item = [[FKItem alloc] init];
		// 设置price属性
		[item nana:30];
		// 访问price属性
		NSLog(@"item的price为：%d" , [item wawa]);
	}
}
