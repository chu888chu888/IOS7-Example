//  Created by yeeku on 2013-5-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKApple.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建FKApple对象
		FKApple* apple = [[FKApple alloc]
			initWithColor:@"红色"
			weight:3.4
			size:20];
		// 对apple对象进行归档		
		[NSKeyedArchiver archiveRootObject:apple
			toFile:@"apple.archive"];
	}
}
