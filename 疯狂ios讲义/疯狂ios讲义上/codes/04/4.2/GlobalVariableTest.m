//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 定义4个全局变量
int sum;
int avg;
int max;
int min;
void statistics(int nums[] , unsigned long len)
{
	min = nums[0];
	for (int i = 0 ; i < len ; i++)
	{
		// 始终让max保存为较大的整数 
		if(nums[i] > max)
		{
			max = nums[i];
		}
		// 始终让min保存较小的整数
		if(nums[i] < min)
		{
			min = nums[i];
		}
		// 统计总和
		sum += nums[i];
	}
	// 计算平均值
	avg = sum / len;
}
int main(int argc , char * argv[])
{
	@autoreleasepool{
		int nums[] = {12, 20 , 4, 20 ,5, 12, 14, 34};
		statistics(nums , sizeof(nums) / sizeof(nums[0]));
		NSLog(@"总和：%d" , sum);
		NSLog(@"平均值：%d" , avg);
		NSLog(@"最大值：%d" , max);
		NSLog(@"最小值：%d" , min);
	}
}
