//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		float arr[3][4] = {
			{1.2 , 2.4},
			{5.6 , 4.5 , 3,2},
			{-1.2 , 4.9}
		};
		NSLog(@"arr与arr[0]代表的地址是相同的：");
		NSLog(@"%p" , arr);
		NSLog(@"%p" , arr[0]);
		NSLog(@"arr + 2与*(arr + 2)代表的地址是相同的：");
		NSLog(@"%p" , arr + 2);
		NSLog(@"%p" , *(arr + 2));
		// 采用指针来遍历二维数组
		for(float* p = arr[0] ; p < arr[0] + 12 ; p++)
		{
			// 控制每输出4个元素，输出一个换行
			if((p - arr[0]) % 4 == 0 && p > arr[0])
			{
				printf("\n");
			}
			printf("%g , " , *p);
		}
		printf("\n");
	}
}

