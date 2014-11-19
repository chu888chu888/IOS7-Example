//  Created by yeeku on 2013-5-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKApple.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 从归档文件中恢复对象	
		FKApple* apple = [NSKeyedUnarchiver 
			unarchiveObjectWithFile:@"apple.archive"];
		// 获取对象的属性
		NSLog(@"苹果的颜色为：%@" , apple.color);
		NSLog(@"苹果的重量为：%g" , apple.weight);
		NSLog(@"苹果的规格为：%d" , apple.size);
	}
}
