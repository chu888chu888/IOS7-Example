//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 声明两个外部函数
void printRect(int , int);
void printTriangle(int);

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 调用两个函数
		printRect(5 , 10);
		printTriangle(7);
	}
}
