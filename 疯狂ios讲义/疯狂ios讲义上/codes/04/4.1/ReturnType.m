//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int discount(int price , double discount)
{
	// 虽然实际返回的是double类型，
	// 但由于声明函数时指定了返回值类型为int
	// 因此系统会将返回值转型为int
	return price * discount;
}
int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		NSLog(@"%d" , discount(78, 0.8));
	}
}
