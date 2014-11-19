//  Created by yeeku on 2013-3-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

@interface ReturnSelf : NSObject
{
	@public
	int _age;
}
- (ReturnSelf*) grow;
@end

@implementation ReturnSelf
- (ReturnSelf*) grow
{
	_age++;
	// return self，返回调用该方法的对象
	return self;
}
@end

int main(int argc , char * argv[])
{
	@autoreleasepool{
		ReturnSelf* rt = [[ReturnSelf alloc] init];
		//可以连续调用同一个方法
		[[[rt grow] grow] grow];
		NSLog(@"rt的_age成员变量的值是:%d" , rt->_age);
	}
}