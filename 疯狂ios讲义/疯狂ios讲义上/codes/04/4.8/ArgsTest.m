//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 输出args数组的长度
		NSLog(@"参数的个数：%d"  , argc);
		// 遍历argv数组的每个元素
		for (int i = 0 ; i < argc ; i++)
		{
			NSLog(@"%s" , argv[$i]);
		}
	}
}