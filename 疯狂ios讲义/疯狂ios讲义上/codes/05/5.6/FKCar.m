//  Created by yeeku on 2013-4-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKCar.h"

@implementation FKCar
@synthesize brand = _brand;
@synthesize model = _model;
@synthesize color = _color;
// 重写init方法，完成自定义初始化
- (id) init
{
	// 调用父类的init方法执行初始化，将初始化得到的对象赋值给self对象
	// 如果self不为nil，表明父类init方法初始化成功
	if(self = [super init])
	{
		// 对该对象的brand、model、color赋初始值
		self.brand = @"奥迪";
		self.model = @"Q5";
		self.color = @"黑色";
	}
	return self;
}
// 实现initWithBrand: model:方法，完成自定义初始化
- (id) initWithBrand:(NSString*) brand model:(NSString*) model
{
	// 调用父类的init方法执行初始化，将初始化得到的对象赋值给self对象
	// 如果self不为nil，表明父类init方法初始化成功
	if(self = [super init])
	{
		// 对该对象的brand、model、color赋初始值
		self.brand = brand;
		self.model = model;
		self.color = @"黑色";
	}
	return self;
}
// 实现initWithBrand: model: color:方法，完成自定义初始化
- (id) initWithBrand:(NSString*) brand model:(NSString*) model
	color:(NSString*) color
{
	// 调用本类的initWithBrand: model:方法执行初始化，将初始化得到的对象赋值给self对象
	// 如果self不为nil，表明initWithBrand: model:方法初始化成功
	if(self = [self initWithBrand:brand model:model])
	{
		// 对该对象的color赋初始值
		self.color = color;
	}
	return self;
}
@end