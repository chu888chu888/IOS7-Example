//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

void sort(char* names[] , int n)
{
	char* tmp;
	// 外轮循环控制依次取得0～n-2个字符串
	for(int i = 0 ; i < n - 1 ; i++)
	{
		// 用第i个字符串，依次与后面的每个字符串相比
		for(int j = i + 1 ; j < n ; j++)
		{
			// 如果names[i]的字符串大于names[j]的字符串, 交换它们
			// 这样就可以保证第i个位置的字符串总比后面的所有字符串小
			if(strcmp(names[i] , names[j]) > 1)
			{
				 tmp = names[i];
				 names[i] = names[j];
				 names[j] = tmp;
			}
		}
	}
}
int main(int argc , char * argv[])
{
	@autoreleasepool{
		int nums = 5;
		// 定义5个字符串
		char* strs[] = {"Objective-C" , "iOS" , "Java"
			, "Ajax" , "Android"};
		// 对字符串排序
		sort(strs , nums);
		// 输出字符串
		for(int i = 0 ; i < nums ; i ++)
		{
			NSLog(@"%s" , strs[i]);
		}
	}
}
