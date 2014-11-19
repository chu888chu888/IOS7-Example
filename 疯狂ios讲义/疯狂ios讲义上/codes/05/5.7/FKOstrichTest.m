//  Created by yeeku on 2013-4-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKOstrich.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建FKOstrich对象
		FKOstrich* os = [[FKOstrich alloc] init];
		// 执行FKOstrich对象的fly方法，将输出"我只能在地上奔跑..."
		[os fly];
		[os callOverridedMethod];
	}
}
