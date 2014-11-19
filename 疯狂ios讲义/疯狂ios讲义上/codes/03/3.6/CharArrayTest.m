//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 定义并初始化字符数组
		char cArr[] = {'I', ' ' , 'l' , 'o' 
			, 'v' , 'e' , ' ' , 'i' , 'O' , 'S'};
		// 遍历、并输出字符数组
		for(int i = 0 , length = sizeof(cArr)/sizeof(cArr[0]);
			i < length ; i ++)
		{
			NSLog(@"%c" , cArr[i]);	
		}
		// 定义一个字符数组，不指定长度，直接用字符串对其执行初始化
		char str[] = "I love iOS";
		// 输出字符串
		printf("%s\n" , str);
		// 定义一个长度为20的字符串，用字符串初始化前几个字符元素
		char str2[20] = "I love iOS";
		// 输出字符串
		printf("%s\n" , str2);
		
		char s1[30] = "hello";
		// 将",fkjava.org"字符串复制到s字符串的后面。
		strcat(s1 , ", fkjava.org");
		printf("%s\n" , s1);
		// 使用strlen获取字符串的长度
		NSLog(@"s1字符串的长度为：%zu" , strlen(s1));
		// 定义一个字符数组
		char s2[40];
		// 不能直接对已有的字符数组赋值，只能用strcpy将已有的字符串复制到s2中。
		strcpy(s2 , s1);
		NSLog(@"%s" , s2);
	}
}
