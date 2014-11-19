//  Created by yeeku on 2013-4-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKItem.h"

FKItem* productItem()
{
	FKItem* item = [FKItem new]; // 引用计数为1
	NSLog(@"函数返回之前的引用计数：%ld" , item.retainCount);
	// 返回的对象的引用计数为1
	return item;
}

int main(int argc , char * argv[])
{
	// it的引用计数为1
	FKItem* it = productItem();
	// 接下来可以调用it的方法
	NSLog(@"%ld" , it.retainCount);
	// ...
	// 程序执行完成后,将it（引用productItem()函数返回值）的引用计数减1
	// 程序使用productItem()函数返回值完成后，延迟销毁it所指向的对象
	[it release];
}