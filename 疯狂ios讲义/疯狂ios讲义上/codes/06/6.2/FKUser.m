//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKUser.h"

@implementation FKUser
@synthesize name = _name;
@synthesize idStr = _idStr;
- (id) initWithName: (NSString*) name idStr: (NSString*) idStr
{
	if(self = [super init])
	{
		self.name = name;
		self.idStr = idStr;
	}
	return self;
}
// 重写isEqual:方法，提供自定义的相等标准
- (BOOL) isEqual: (id) other
{
	// 如果两个对象为同一个对象
	if (self == other)
		return YES;
	// 当other不为null，且它是FKUser类的实例时
	if (other != nil && [other isMemberOfClass:FKUser.class])
	{
		FKUser* target = (FKUser*)other;
		//并且当前对象的idStr与target对象的idStr相等才可判断两个对象相等
		return [self.idStr isEqual: target.idStr];
	}
	return NO;
}
@end
