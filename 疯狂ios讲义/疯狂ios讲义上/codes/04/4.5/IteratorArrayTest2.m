//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		int arr[] = {4, 20 , 10 , -3, 34};
		for(int* p = arr , len = sizeof(arr) / sizeof(arr[0]);
			p < arr + len ; p++)
		{
			// 通过指针来访问数组元素
			NSLog(@"%d" , *p);
		}
	}
}