//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKItem.h"

@interface FKOrder : NSObject
// 使用@property定义两个属性
@property(nonatomic , strong) FKItem* item;
@property(nonatomic , assign) int amount;
-(int) totalPrice;
@end
