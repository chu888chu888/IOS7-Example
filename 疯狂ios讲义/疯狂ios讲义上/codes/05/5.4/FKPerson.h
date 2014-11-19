//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

@interface FKPerson : NSObject
{
	// 使用@private限制成员变量
	@private
	NSString* _name;
	int _age;
}
//提供方法来操作name Field
- (void) setName: (NSString*) name;
// 提供方法来获取_name成员变量的值
- (NSString*) name;
// 提供方法来设置age成员变量
- (void) setAge:(int) age;
// 提供方法来获取_age成员变量的值
- (int) age;
@end
