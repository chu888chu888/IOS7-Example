//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
// 定义一个函数，该函数的形参为两个int型变量
int big(int x , int y)
{
	// 如果x>y返回1；如果x<y返回-1，如果x==y，返回0
	return x > y ? 1 : (x < y ? -1 : 0);
}

int main(int argc , char * argv[])
{
	@autoreleasepool{
		int a[10] , b[10];
		// 采用循环读入10个数值作为第一个数组元素的值
		NSLog(@"输入第一个数组的10个元素：");
		for(int i = 0 ; i < 10 ; i++)
		{
			scanf("%d" , &a[i]);
		}
		// 采用循环读入10个数值作为第二个数组元素的值
		NSLog(@"输入第二个数组的10个元素：");
		for(int i = 0 ; i < 10 ; i++)
		{
			scanf("%d" , &b[i]);
		}
		int aBigCount = 0;
		int bBigCount = 0;
		int equalsCount = 0;
		// 采用循环依次比较a、b两个数组的元素
		// 并累计他们的比较结果
		for(int i= 0 ; i < 10 ; i++)
		{
			NSLog(@"%d , %d" , a[i], b[i]);
			if(big(a[i] , b[i]) == 1)
			{
				aBigCount ++;
			}
			else if(big(a[i] , b[i]) == -1)
			{
				bBigCount ++;
			}
			else
			{
				equalsCount ++;
			}
		}
		NSLog(@"a数组元素更大的次数%d, b数组元素更大的次数为：%d , 相等次数为：%d"
			, aBigCount , bBigCount, equalsCount);
		NSString * result = aBigCount > bBigCount ?
			@"a数组更大": (aBigCount < bBigCount ? @"b数组更大" : @"两个数组相等");
		NSLog(@"%@" , result);
	}
}
