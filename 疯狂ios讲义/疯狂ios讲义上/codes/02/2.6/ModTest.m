//  Created by yeeku on 2013-3-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool {
		int a = 5;
		int b = 3;
		int mod = a % b;
		// mod的值为2
		NSLog(@"%d", mod);
		// 下面代码会生成警告
		NSLog(@"5对0.0求余的结果是:%d", 5 % 0);
	}
}
