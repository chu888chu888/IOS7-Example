//  Created by yeeku on 2013-4-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "NSNumber+fk.h"

// 为类别提供实现部分
@implementation NSNumber (fk)
// 实现类别的接口部分定义的4个方法
- (NSNumber*) add: (double) num2
{
	return [NSNumber numberWithDouble: 
		([self doubleValue] + num2)];
}	
- (NSNumber*) substract: (double) num2
{
	return [NSNumber numberWithDouble: 
		([self doubleValue] - num2)];
}
- (NSNumber*) multiply: (double) num2
{
	return [NSNumber numberWithDouble: 
		([self doubleValue] * num2)];
}	
- (NSNumber*) divide: (double) num2
{
	return [NSNumber numberWithDouble: 
		([self doubleValue] / num2)];
}	
@end
