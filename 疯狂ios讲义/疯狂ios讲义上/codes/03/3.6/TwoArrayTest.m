//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 定义、并初始化二维数组
		int arr1[3][4] = {
			// 下面定义了3个元素，每个元素都是长度为4的一维数组
			{2, 20 , 10 , 4},
			{4 , 100, 20 , 34},
			{5 , 12 , -12 , -34}
		};
		// 采用循环来遍历二维数组
		for(int i = 0 ,length = sizeof(arr1) / sizeof(arr1[0]);
			i < length ; i++)
		{
			for(int j = 0 , len = sizeof(arr1[i]) / sizeof(arr1[i][0]);
				j < len ; j++)
			{
				printf("%d\t" , arr1[i][j]);
			}
			printf("\n");
		}
		NSLog(@"-----------------------------");
		// 定义并初始化二维数组
		int arr2[3][4] = {
			// 下面定义了3个元素，每个元素都是长度为4的一维数组
			// 但初始化为4的数组时，都只初始化第一个元素，其他元素使用默认初始值
			{2, 12},
			{4},
			{5}
		};
		// 采用循环来遍历二维数组
		for(int i = 0 ,length = sizeof(arr2) / sizeof(arr2[0]);
			i < length ; i++)
		{
			for(int j = 0 , len = sizeof(arr2[i]) / sizeof(arr2[i][0]);
				j < len ; j++)
			{
				printf("%d\t" , arr2[i][j]);
			}
			printf("\n");
		}
		NSLog(@"-----------------------------");
		// 定义并初始化二维数组
		int arr2x[3][4] = {
			// 下面只定义了1个元素，其他元素采用默认初始化
			// 但初始化为4的数组时，只初始化第2个元素，其他元素使用默认初始值
			{2 , 12},	
		};
		// 采用循环来遍历二维数组
		for(int i = 0 ,length = sizeof(arr2x) / sizeof(arr2x[0]);
			i < length ; i++)
		{
			for(int j = 0 , len = sizeof(arr2x[i]) / sizeof(arr2x[i][0]);
				j < len ; j++)
			{
				printf("%d\t" , arr2x[i][j]);
			}
			printf("\n");
		}
		NSLog(@"-----------------------------");
		// 定义、并初始化二维数组，省略二维数组的长度
		int arr3[][4] = {
			// 下面定义了3个元素，每个元素都是长度为4的一维数组
			{2, 20 },
			{4 , 100, 20},
			{5}	
		};
		for(int i = 0 ,length = sizeof(arr3) / sizeof(arr3[0]);
			i < length ; i++)
		{
			for(int j = 0 , len = sizeof(arr3[i]) / sizeof(arr3[i][0]);
				j < len ; j++)
			{
				printf("%d\t" , arr3[i][j]);
			}
			printf("\n");
		}
		NSLog(@"-----------------------------");
		// 定义并初始化二维数组
		int arr4[3][4] = {
			// 由于本身指定了二维数组是一个长度为3的数组，
			// 且每个数组元素都长度为4的一维数组
			// 因此可以直接给出12个数组元素
			2, 20 , 10 , 4,
			4 , 100, 20 , 34,
			5 , 12 , -12 , -34
		};
		for(int i = 0 ,length = sizeof(arr4) / sizeof(arr4[0]);
			i < length ; i++)
		{
			for(int j = 0 , len = sizeof(arr4[i]) / sizeof(arr4[i][0]);
				j < len ; j++)
			{
				printf("%d\t" , arr4[i][j]);
			}
			printf("\n");
		}		
		NSLog(@"-----------------------------");
		int arr5[][4] = {
			// 由于已经指定了二维数组的数组元素为长度为4的一维数组
			// 系统将会根据给出的元素个数（5个）推断出二维数组的长度为2
			2, 20 , 10 , 4, 4
		};
		for(int i = 0 ,length = sizeof(arr5) / sizeof(arr5[0]);
			i < length ; i++)
		{
			for(int j = 0 , len = sizeof(arr5[i]) / sizeof(arr5[i][0]);
				j < len ; j++)
			{
				printf("%d\t" , arr5[i][j]);
			}
			printf("\n");
		}
	}
}
