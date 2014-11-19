//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
// 定义一个块变量类型
typedef void (^FKProcessBlock)(int);
// 使用FKProcessBlock定义最后一个参数类型为块
void processArray(int array[] 
	, unsigned int len, FKProcessBlock process)
{
	for(int i = 0 ; i < len; i ++)
	{
		// 将数组元素作为参数调用块
		process(array[i]);
	}
}
int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 定义一个数组
		int arr[] = {2, 4, 6};
		// 传入块作为参数调用processArray()函数
		processArray(arr , 3 , ^(int num)
		{
			NSLog(@"元素平方为：%d" , num * num);
		});
	}
}