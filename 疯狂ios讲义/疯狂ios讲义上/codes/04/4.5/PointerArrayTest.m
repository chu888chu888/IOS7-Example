//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		int arr[] = {4, 20 , 10 , -3, 34};
		// 将arr第一个数组元素的地址赋给指针变量p
		int* p = &arr[0];
		// 将arr数组变量当成指针输出
		NSLog(@"%p" , arr);
		// 输出指针变量p
		NSLog(@"%p" , p);
	}
}

