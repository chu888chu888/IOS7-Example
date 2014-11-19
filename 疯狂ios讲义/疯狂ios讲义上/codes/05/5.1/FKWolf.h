//  Created by yeeku on 2013-3-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

@interface FKWolf : NSObject
{
	NSString* _name;
	int _age;
}
// 定义一个setName:ageAge方法
- (void) setName: (NSString*) _name andAge: (int) _age;
// 定义一个info方法
- (void) info;
@end
