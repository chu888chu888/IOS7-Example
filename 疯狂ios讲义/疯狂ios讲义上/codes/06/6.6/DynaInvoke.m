//  Created by yeeku on 2013-4-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import <objc/message.h>
#import "FKCar.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 获取FKCar类
		Class clazz = NSClassFromString(@"FKCar");
		// 动态创建FKCar对象
		id car = [[clazz alloc] init];
		// 使用performSelector:方法来动态调用方法
		[car performSelector:@selector(addSpeed:) 
			withObject: [NSNumber numberWithDouble:3.4]];
		// 使用objc_msgSend()函数动态调用方法
		objc_msgSend(car , @selector(addSpeed:) , 3.4);
		// 定义函数指针变量
		double (addSpeed*)(id , SEL , double) ;
		// 获取car对象的addSpeed:方法，并将该方法赋给addSpeed函数指针变量
		addSpeed = (double(*)(id ,SEL , double))[car
			 methodForSelector:NSSelectorFromString(@"addSpeed:")];
		// 通过addSpeed函数指针变量来调用car对象的方法
		double speed = addSpeed(car , @selector(addSpeed:) , 2.4);
		// 输出调用方法的返回值
		NSLog(@"加速后的速度为：%g" , speed);
	}
}

