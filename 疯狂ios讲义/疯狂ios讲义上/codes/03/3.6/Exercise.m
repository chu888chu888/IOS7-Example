//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		int SIZE = 7;
		int array[SIZE][SIZE];
		// 该orient代表绕圈的方向
		// 其中0代表向下, 1代表向右, 2代表向左, 3代表向上
		int orient = 0;
		// 控制将1～SIZE * SIZE的数值填入二维数组
		// 其中j控制行索引，k控制列索引
		for (int i = 1 , j = 0 , k = 0; i <= SIZE * SIZE ; i++ )
		{
			array[j][k] = i;
			// 如果位于图3.5的①号转弯线
			if((j + k == SIZE - 1))
			{
				// j>k，位于左下角
				if(j > k)
				{
					orient = 1;
				}
				// 位于右上角
				else
				{
					orient = 2;
				}
			}
			// 如果位于图3.5中②号转弯线
			else if(k == j && k >= SIZE / 2)
			{
				orient = 3;
			}
			// 如果j位于图3.5的③号转弯线
			else if((j == k - 1) && k <= SIZE / 2)
			{
				orient = 0;
			}
			// 根据方向来控制行索引、列索引的改变
			switch(orient)
			{
				// 如果方向为向下绕圈
				case 0:
					j++;
					break;
				// 如果方向为向右绕圈
				case 1:
					k++;
					break;
				// 如果方向为向左绕圈
				case 2:
					k--;
					break;
				// 如果方向为向上绕圈
				case 3:
					j--;
					break;
			}
		}
		// 采用遍历输出上面的二维数组
		for (int i = 0 ; i < SIZE ; i++ )
		{
			for (int j = 0; j < SIZE; j++)
			{
				if(array[i][j] < 10)
				{
					printf("0%d " , array[i][j]);
				}
				else
				{
					printf("%d " , array[i][j]);
				}
			}
			printf("\n");
		}
	}
}
