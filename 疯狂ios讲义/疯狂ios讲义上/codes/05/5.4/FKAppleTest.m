//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKApple.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		FKApple* apple = [[FKApple alloc] init];
		// 下面程序程序直接访问@package限制的成员变量
		apple->_weight = 30.4;
		NSLog(@"apple的重量为：%g" , apple->_weight);
	}
}