//  Created by yeeku on 2013-4-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKCar+drive.h"

// 为FKCar提供实现部分
@implementation FKCar
@synthesize brand;
@synthesize model;
@synthesize color;
- (void) drive;
{
	NSLog(@"%@汽车正在路上奔驰" , self);
}
- (void) drive:(NSString*) owner
{
	NSLog(@"%@正驾驶%@汽车在路上奔驰" , owner , self);
}
- (NSString*) description
{
	return [NSString stringWithFormat:@"<FK[brand=%@,model=%@,color=%@]>"
		, self.brand , self.model ,self.color];
}
@end
