//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 定义函数，使用字符指针作为参数
void copyString(char* to , char* from)
{
	// 如果from指针指向的字符不为\0。
	while(*from)
	{
		// 将from变量指向的字符赋给to变量指向的元素
		*to++ = *from++;
	}
	*to = '\0';
}
int main(int argc , char * argv[])
{
	@autoreleasepool{
		char* str = "www.crayit.org";
		char dest[100];
		// 将str赋值到dest中
		copyString(dest , str);  //①
		NSLog(@"%s" , dest);
		// 将字符串复制到dest中
		copyString(dest , "Objective-C is Funny!");  //②
		NSLog(@"%s" , dest);
		
char* st; // 定义char*型指针变量
scanf("%s" , st); // 读取键盘输入的字符串，将字符串存入str所代表的数组中。
				
		NSLog(@"%s" , st);
						
	}
}