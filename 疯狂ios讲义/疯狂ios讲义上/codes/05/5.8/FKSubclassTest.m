//  Created by yeeku on 2013-4-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKSubclass.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 下面编译时类型和运行时类型完全一样，因此不存在多态
		FKBase* bc = [[FKBase alloc] init];
		// 下面两次调用将执行BaseClass的方法
		[bc base];
		[bc test];
		// 下面编译时类型和运行时类型完全一样，因此不存在多态
		FKSubclass* sc = [[FKSubclass alloc] init];
		// 下面调用将执行从父类继承到的base方法
		[sc base];
		// 下面调用将执行子类重写的test方法
		[sc test];
		// 下面调用将执行子类定义的sub方法
		[sc sub];
		// 下面编译时类型和运行时类型不一样，多态发生
		FKBase* ploymophicBc = [[FKSubclass alloc] init];
		// 下面调用将执行从父类继承到的base方法
		[ploymophicBc base];
		// 下面调用将执行子类重写的test方法
		[ploymophicBc test];
		// 因为ploymophicBc的编译类型是FKBase
		// FKBase类没有提供sub方法,所以下面代码编译时会出现错误。
		[ploymophicBc sub];
		// 可将任何类型的指针变量赋值给id类型的变量
		id dyna = ploymophicBc;
		[dyna sub];
	}
}