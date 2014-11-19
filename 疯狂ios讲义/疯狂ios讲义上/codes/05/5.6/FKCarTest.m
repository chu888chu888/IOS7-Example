//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKCar.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建并初始化FKCar对象
		FKCar* car1 = [[FKCar alloc] init];
		// 访问car1对象的属性
		NSLog(@"car1的brand为%@" , car1.brand);
		NSLog(@"car1的model为%@" , car1.model);
		NSLog(@"car1的color为%@" , car1.color);
		// 创建并初始化FKCar对象
		FKCar* car2 = [[FKCar alloc] initWithBrand:@"奔驰"
			model:@"ML350"];
		// 访问car1对象的属性
		NSLog(@"car2的brand为%@" , car2.brand);
		NSLog(@"car2的model为%@" , car2.model);
		NSLog(@"car2的color为%@" , car2.color);
		// 创建并初始化FKCar对象
		FKCar* car3 = [[FKCar alloc] initWithBrand:@"宝马"
			model:@"X5" color:@"BLACK"];
		// 访问car1对象的属性
		NSLog(@"car3的brand为%@" , car3.brand);
		NSLog(@"car3的model为%@" , car3.model);
		NSLog(@"car3的color为%@" , car3.color);				
	}
}
