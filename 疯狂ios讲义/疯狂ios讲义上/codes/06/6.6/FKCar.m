//  Created by yeeku on 2013-4-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <objc/message.h>
#import "FKCar.h"

// 为FKCar提供实现部分
@implementation FKCar
- (void) move:(NSNumber*) count
{
	int num = [count intValue];
	for (int i = 0 ; i < num ; i++)
	{
		NSLog(@"%@", [NSString stringWithFormat
			:@"汽车正在路上走～～%d" , i]); 
	}
}
- (double) addSpeed:(double) factor
{
	// 此处希望能动态调用move方法
	// 使用performSelector:动态调用move:方法
	[self performSelector:@selector(move:) 
		withObject: [NSNumber numberWithInt: 2]];
	[self performSelector:NSSelectorFromString(@"move:") 
		withObject: [NSNumber numberWithInt: 2]];
	// 使用objc_msgSend()函数动态调用move:方法
	objc_msgSend(self , @selector(move:)
		, [NSNumber numberWithInt: 3]);
	objc_msgSend(self , NSSelectorFromString(@"move:")
		, [NSNumber numberWithInt: 3]);
	NSLog(@"正在加速。。。%g" , factor);
	return 100 * factor;
}
@end