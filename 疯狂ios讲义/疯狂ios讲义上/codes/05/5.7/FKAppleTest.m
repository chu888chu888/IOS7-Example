//  Created by yeeku on 2013-4-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKApple.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建FKApple的对象
		FKApple* a = [[FKApple alloc] init];
		// FKApple对象本身没有weight属性
		// 因为FKApple的父类有weight属性，也可以访问Apple对象的weight属性
		a.weight = 56;
		// 调用FKApple对象的info方法
		[a info];
	}
}
