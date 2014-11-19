//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 将指定数组的i和j索引处的元素交换
void swap(int* data, int i, int j)
{
	int tmp;
	tmp = *(data + i);
	*(data + i) = *(data + j);
	*(data + j) = tmp;
}
// 对data数组中从start～end索引范围的子序列进行处理
// 使之满足所有小于分界值的放在左边，所有大于分界值的放在右边
void subSort(int* data
	, int start , int end)
{
	// 需要排序
	if (start < end)
	{
		// 以第一个元素作为分界值
		int base = *(data + start);
		// i从左边搜索，搜索大于分界值的元素的索引
		int i = start;
		// j从右边开始搜索，搜索小于分界值的元素的索引
		int j = end + 1;
		while(true)
		{
			// 找到大于分界值的元素的索引，或i已经到了end处
			while(i < end && data[++i] <= base);
			// 找到小于分界值的元素的索引，或j已经到了start处
			while(j > start && data[--j] >= base);
			if (i < j)
			{
				swap(data , i , j);
			}
			else
			{
				break;
			}
		}
		swap(data , start , j);
		// 递归左子序列
		subSort(data , start , j - 1);
		// 递归右边子序列
		subSort(data , j + 1, end);
	}
}
void quickSort(int* data , int len)
{
	subSort(data , 0 , len - 1);
}
void printArray(int* array , int len)
{
	for(int* p = array ; p < array + len ; p++)
	{
		printf("%d," , *p);
	}
	printf("\n");
}
int main(int argc , char * argv[])
{
	@autoreleasepool{
		
		int data[] = {9, -16 , 21 ,123 ,-60 ,-49 , 22 , 30 ,13};                                                                      
		int len = sizeof(data) / sizeof(data[0]);
		NSLog(@"排序之前");
		printArray(data, len);
		quickSort(data , len);                                     
		NSLog(@"排序之后");
		printArray(data, len);
	}
}

