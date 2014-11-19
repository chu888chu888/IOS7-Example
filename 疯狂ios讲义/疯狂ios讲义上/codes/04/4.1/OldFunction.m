//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

void printMsg(msg , loopNum)
// 另起一行，专门对形参类型进行说明
int loopNum;
NSString * msg;
// 函数体
{
	for (int i = 0 ; i < loopNum ; i++)
	{
		NSLog(@"%@" , msg);	
	}
}
int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		printMsg(@"fkjava.org" , 5);
	}
}
