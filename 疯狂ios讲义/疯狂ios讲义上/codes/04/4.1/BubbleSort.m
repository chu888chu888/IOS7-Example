//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 定义一个函数，该函数返回NSString
void bubbleSort(int nums[] , unsigned long len)
{
	// 控制本轮循环是否有发生过交换
	// 如果没有发生交换，那么说明该数组已经处于有序状态，可以提前结束排序
	BOOL hasSwap = YES;
	for (int i = 0; i < len && hasSwap; i++)
	{
		// 将hasSwap设为NO
		hasSwap = NO;
		for (int j = 0 ; j < len - 1 - i ; j++)
		{
			// 如果nums[j]大于nums[j + 1]，交换它们
			if(nums[j] > nums[j + 1])
			{
				int tmp = nums[j];
				nums[j] = nums[j + 1];
				nums[j + 1] = tmp;
				// 本轮循环发生过交换，将hasSwap设为YES
				hasSwap = YES;
			}
		}
	}
}

int main(int argc, const char * argv[])
{
	@autoreleasepool {
		// 随便给出一个整数数组
		int nums[] = {12 , 2, 23, 15 , -20 , 14};
		// 计算数组的长度
		int len = sizeof(nums) / sizeof(nums[0]);
		// 调用函数对数组排序
		bubbleSort(nums , len);
		// 采用遍历，输出数组元素
		for(int i = 0 ; i < len ; i++)
		{
			printf("%d," , nums[i]);
		}
		// 输出换行
		printf("\n");
	}
}

