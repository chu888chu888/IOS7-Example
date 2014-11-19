//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "NSNumber+fk.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		NSNumber* myNum = [NSNumber numberWithInt: 3];
		// 测试add:方法
		NSNumber* add = [myNum add:2.4];
		NSLog(@"%@" , add);
		// 测试substract:方法
		NSNumber* substract = [myNum substract:2.4];
		NSLog(@"%@" , substract);
		// 测试multiply:方法
		NSNumber* multiply = [myNum multiply:2.4];
		NSLog(@"%@" , multiply);
		// 测试divide:方法
		NSNumber* divide = [myNum divide:2.4];
		NSLog(@"%@" , divide);		
	}
}
