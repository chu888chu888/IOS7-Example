//  Created by yeeku on 2013-4-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKApple.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		@try
		{
			// 创建FKApple对象
			FKApple* app = [[FKApple alloc] init];
			// 调用taste方法
			[app taste];
		}
		@catch(NSException* ex)
		{
			NSLog(@"==捕捉异常==");
			NSLog(@"捕捉异常:%@，%@" , ex.name , ex.reason);
		}
		@finally
		{
			// 此处可进行资源回收等操作
			NSLog(@"资源回收！");
		}
		NSLog(@"程序执行完成！");
	}
}