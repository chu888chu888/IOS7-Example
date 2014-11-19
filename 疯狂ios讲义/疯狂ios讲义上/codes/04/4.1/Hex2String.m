//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 定义一个函数，该函数返回NSString
NSString * hex2String(char hex[] , unsigned long len)
{
	// 定义一个长度为len/2+1的字符数组
	char tmp[len/2 + 1];
	// 遍历hex字符数组，每2个数值转换一个字符
	for (int i = 0 , j = 0; i < len; i+=2 , j++)
	{
		// 如果十位的数值为a～f，减去87得到对应的数值。
		// 比如'a'-87=10，也就是a在16进制数中代表的的数值
		// 如果十位的数值为A～F，减去55得到对应的数值。
		// 比如'A'-55=10，也就是A在16进制数中代表的的数值
		// 如果十位的数值为0～9，减去48得到对应的数值。
		// 比如'8'-48=8，也就是8在16进制数中代表的的数值
		int shiBit = hex[i] >= 97 ? hex[i] - 87 :
		(hex[i] >= 65 ? hex[i] - 55 : hex[i] - 48);
		// 计算得到个位的数值
		int geBit = hex[i + 1] >= 97 ? hex[i + 1] - 87 :
		(hex[i + 1] >= 65 ? hex[i + 1] - 55 : hex[i + 1] - 48);
		// 计算出16进制数的数值
		int intTmp = shiBit * 16 + geBit;
		// 将16进制数值转换为char后，赋值给字符数组的元素
		tmp[j] = intTmp;
	}
	// 将字符数组转换为NSString对象
	return [NSString stringWithCString:tmp encoding: NSASCIIStringEncoding];
}

int main(int argc, const char * argv[])
{
	@autoreleasepool {
		char hex[] = "616162636464";
		// 调用第一次转换
		NSLog(@"%@" , hex2String(hex , strlen(hex)));
		char hex2[] = "6a6b6c6D6E6f70717273";
		// 调用第二次转换
		NSLog(@"%@" , hex2String(hex2 , strlen(hex2)));
	}
}

