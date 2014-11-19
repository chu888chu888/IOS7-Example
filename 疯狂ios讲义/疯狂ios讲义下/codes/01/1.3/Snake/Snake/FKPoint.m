//
//  FKPoint.m
//  Snake
//
//  Created by yeeku on 13-7-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKPoint.h"

@implementation FKPoint
- (id)initWithX:(NSInteger)x y:(NSInteger)y
{
    self = [super init];
    if (self) {
        _x = x;
		_y = y;
    }
    return self;
}
- (BOOL) isEqual:(FKPoint*)other
{
	if(self == other)
	{
		return YES;
	}
	if (FKPoint.class == [other class])
	{
		return self.x == other.x
		&& self.y == other.y;
	}
	return NO;
}
- (NSString*)description
{
	return [NSString stringWithFormat:@"{%d,%d}" , self.x,self.y];
}
@end
