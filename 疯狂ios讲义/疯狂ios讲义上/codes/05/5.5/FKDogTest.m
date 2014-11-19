//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKDog.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建FKDog对象
		FKDog* dog = [[FKDog alloc] init];
		// 使用KVC方式为name属性赋值，KVC的搜索顺序为：
		// ①.setName:方法、②._name成员变量、③.name成员变量
		[dog setValue:@"旺财" forKey:@"name"];
		// 访问name、_name两个成员变量的值。		
		NSLog(@"dog->name:%@" , dog->name);			
		NSLog(@"dog->_name:%@" , dog->_name);
		// 使用KVC对age赋值，将会导致类实现部分定义的age成员变量被赋值
		[dog setValue: [NSNumber numberWithInt:5] forKey:@"age"];
		NSLog(@"dog的age:%@" , [dog valueForKey:@"age"]);			
	}
}
