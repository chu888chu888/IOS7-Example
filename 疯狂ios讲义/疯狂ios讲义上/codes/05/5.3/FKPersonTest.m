//  Created by yeeku on 2013-4-6.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

@interface FKPerson : NSObject
{
	@public
	// 定义2个实例变量
	NSString* _name;
	int _age;
}
@end
@implementation FKPerson
@end
int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 创建Person对象
		FKPerson* p = [[FKPerson alloc] init];
		// 通过指针变量来访问Person对象_name、_age实例变量
		NSLog(@"p变量的_name实例变量的值是：%@，p对象的_age成员变量的值是：%d"
			, p->_name , p->_age);
		// 直接为p的name实例变量赋值
		p->_name = @"孙悟空";
		// 直接为p的age实例变量赋值
		p->_age = 500;
		// 再次通过指针变量来访问Person对象_name、_age实例变量
		NSLog(@"p变量的_name实例变量的值是：%@，p对象的_age成员变量的值是：%d"
			, p->_name , p->_age);
		// 创建第一个FKPerson对象
		FKPerson* p1 = [[FKPerson alloc] init];
		// 创建第二个FKPerson对象
		FKPerson* p2 = [[FKPerson alloc] init];
		// 分别为两个FKPerson对象的name成员变量赋值
		p1->_name = @"张三";
		p2->_name = @"孙悟空";
			
	}
}
