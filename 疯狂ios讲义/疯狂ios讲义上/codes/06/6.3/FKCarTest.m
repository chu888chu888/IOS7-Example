//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKCar+drive.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建一个FKCar对象
		FKCar* car = [[FKCar alloc] init];
		// 使用点语法为car对象的属性赋值
		car.brand = @"宝马";
		car.model = @"X5";
		car.color = @"黑色";
		// 调用car的方法
		[car drive];
		[car drive:@"孙悟空"];	
	}
}
