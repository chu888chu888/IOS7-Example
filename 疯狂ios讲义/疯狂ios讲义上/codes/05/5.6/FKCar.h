//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

@interface FKCar : NSObject
// 使用@property定义3个属性
@property (nonatomic , copy) NSString* brand;
@property (nonatomic , copy) NSString* model;
@property (nonatomic , copy) NSString* color;
// 定义initWithBrand: model:方法，完成自定义初始化
- (id) initWithBrand:(NSString*) brand model:(NSString*) model;
// 定义initWithBrand: model: color:方法，完成自定义初始化
- (id) initWithBrand:(NSString*) brand model:(NSString*) model
	color:(NSString*) color;
@end
