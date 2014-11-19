//  Created by yeeku on 2013-4-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 定义类的接口部分
@interface FKCar : NSObject
@property (nonatomic , copy) NSString* brand;
@property (nonatomic , copy) NSString* model;
- (void) drive;
@end
