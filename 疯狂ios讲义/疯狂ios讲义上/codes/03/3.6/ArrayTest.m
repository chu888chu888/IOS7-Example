//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		int len = 5;
		// 定义数组，不执行初始化。系统为数组元素指定默认的初始值。
		int arr[len];
		// 定义数组时，指定长度，并完整地指定了数组的5个元素。
		int arr2[5] = {2, 3, 40 , 300, 100};
		// 只指定前面3个数组元素的值，后面2个数组元素默认为0。
		int arr3[5] = {2, 3, 40}; 
		// 数组长度为3。
		int arr4[] = {2, 3 , 40};
		// 定义长度为4的指针类型数组，所有数组元素默认为空。
		NSDate * arr5[4];
		// 定义指针类型的数组，指定每个数组元素的值，系统推断数组长度为3。
		char * arr6[] = {"李刚", "fkjava.org", "crazyit.org"};
		// 定义长度为4的数组，后面2个数组元素为空
		NSString * arr7[4] = {@"疯狂iOS讲义" , @"疯狂Ajax讲义"};
	
		// 输出arr6数组的第二个元素，将输出字符串"fkjava.org"
		NSLog(@"%s" , arr6[1]);
		// arr6的第一个数组元素赋值
		arr6[0] = "Spring";
		// 访问数组元素的索引与数组长度相同，编译器会生成警告，运行的结果是不可预期的。
		NSLog(@"%d" , arr[5]);
		
		// 遍历元素为基本类型的数组元素
		for (int i = 0, length = sizeof(arr2) / sizeof(arr2[0]);
			i < length ; i ++)
		{
			NSLog(@"arr2[%d] : %d" , i , arr2[i]);
		}
		
		// 遍历元素为指针类型的数组元素
		for (int i = 0, length = sizeof(arr7) / sizeof(arr7[0]);
			i < length ; i ++)
		{
			NSLog(@"arr7[%d] : %@" , i , arr7[i]);
		}
		
		//对数组元素进行赋值
		arr[0] = 42;
		arr[1] = 341;
		// 采用遍历方式来输出数组元素
		for(int i = 0 , length = sizeof(arr) / sizeof(arr[0]);
			i < length; i++)
		{
			NSLog(@"arr[%d]: %d" , i , arr[i]);
		}
	}
}
