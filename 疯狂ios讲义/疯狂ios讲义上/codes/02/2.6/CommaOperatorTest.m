//  Created by yeeku on 2013-3-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 定义变量a的值为2
		int a = 2;
		// 将a赋值为逗号表达式的值，结果a的值为真（用1代表）
		a = (a *= 3 , 5 < 8);
		NSLog(@"%d" , a) ;
		// 对a连续赋值，最后a的值为9，整个都好表达式返回9，因此x的值为9
		int x  = (a = 3, a = 4, a = 6 , a = 9);
		NSLog(@"a:%d, x: %d" , a, x);
	}
}