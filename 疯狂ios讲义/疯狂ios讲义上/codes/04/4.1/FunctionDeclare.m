//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 声明函数，可用以下两种方式的任意其中之一
// void printMsg(NSString * msg , int loopNum);
void printMsg(NSString * , int);
int main(int argc , char * argv[])
{
	@autoreleasepool{
		printMsg(@"fkjava.org" , 5);
	}
}
void printMsg(NSString * msg , int loopNum)
{
	for (int i = 0 ; i < loopNum ; i++)
	{
		NSLog(@"%@" , msg);	
	}
}