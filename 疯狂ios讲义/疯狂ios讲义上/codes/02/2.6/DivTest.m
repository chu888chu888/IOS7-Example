//  Created by yeeku on 2013-3-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool {
		NSLog(@"19/4的结果是:%d" , 19/4);
		double a = 5.2;
		double b = 3.1;
		double div = a / b;
		// div的值将是1.67742
		NSLog(@"%g" , div);
		// 输出正无穷大：Infinity
		NSLog(@"5除以0.0的结果是:%g" , 5 / 0.0);
		// 输出负无穷大：-Infinity
		NSLog(@"-5除以0.0的结果是:%g" , -5 / 0.0);
		// 下面代码将出现警告，但最终也会输出负无穷大
		NSLog(@"-5.0除以0的结果是:%g" , -5 / 0);
	}
}
