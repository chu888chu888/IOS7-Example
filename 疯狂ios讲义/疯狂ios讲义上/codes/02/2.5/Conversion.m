//  Created by yeeku on 2013-3-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char* argv[]) 
{
	@autoreleasepool {
		int a = 100;
		int b = 3;
		// 直接计算
		float f1 = a / b;
		// 执行强制转换
		float f2 = (float) a / b;
		// 输出33
		NSLog(@"%g" , f1);
		// 输出33.3333
		NSLog(@"%g" , f2);
		
		int it = (int)2.3 + (int)122.2;
		NSLog(@"%d" , it);
	}
}
