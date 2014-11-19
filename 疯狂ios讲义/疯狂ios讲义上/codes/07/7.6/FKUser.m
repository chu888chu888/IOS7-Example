//  Created by yeeku on 2013-4-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKUser.h"

@implementation FKUser
@synthesize name;
@synthesize pass;
- (id) initWithName:(NSString*) aName
	pass:(NSString*) aPass
{
	if(self = [super init])
	{
		name = aName;
		pass = aPass;
	}
	return self;
}
- (void) say:(NSString*) content
{
	NSLog(@"%@说：%@",self.name , content);
}
// 会重写isEqual:方法，重写该方法的比较标准是，
// 如果两个FKUser的name、pass相等，即可认为两个FKUser相等。
- (BOOL) isEqual:(id)other
{
	if(self == other)
	{
		return YES;
	}
	if([other class] == FKUser.class)
	{
		FKUser* target = (FKUser*)other;
		return [self.name isEqualToString:target.name]
			&& [self.pass isEqualToString:target.pass];
	}
	return NO;
}
// 重写hash方法，重写该方法的比较标准是，
// 如果两个FKUser的name、pass相等，两个FKUser的hash方法返回值相等
- (NSUInteger) hash
{
	NSLog(@"===hash===");
	NSUInteger nameHash = name == nil ? 0 : [name hash];
	NSUInteger passHash = pass == nil ? 0 : [pass hash];
	return nameHash * 31 + passHash;
}
// 重写description方法，可以直接看到FKUser对象的状态
- (NSString*) description
{
	return [NSString stringWithFormat:
		@"<FKUser[name=%@, pass=%@]>"
		, self.name , self.pass];
}
@end