//  Created by yeeku on 2013-3-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{

		// 直接对!5求非运算，将返回假（用0表示）
		NSLog(@"!5的结果为：%d" , !5);	
		// 5>3返回真，'6'转换为整数54，'6'>10返回真，求与后返回真（用1表示）
		NSLog(@" 5 > 3 && '6' > 10的结果为：%d" 
			, 5 > 3 && '6' > 10);
		// 4>=5返回假，'c'>'a'返回真。求或后返回真（用1表示）
		NSLog(@"4 >= 5 || 'c' > 'a'的结果为：%d" 
			,4 >= 5 || 'c' > 'a'); 
		// 4>=5返回假，'c'>'a'返回真。两个不同的操作数求异或返回真（用1表示）
		NSLog(@"4 >= 5 ^ 'c' > 'a'的结果为：%d"
			 ,4 >= 5 ^ 'c' > 'a');
	
	}
}