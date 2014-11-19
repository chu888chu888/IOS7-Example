//  Created by yeeku on 2013-4-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKApple.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建FKApple对象
		FKApple* app = [[FKApple alloc] init];
		// 调用taste方法
		[app taste];
	}
}