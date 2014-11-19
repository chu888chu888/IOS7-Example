//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKItem.h"

@interface FKItemView : NSObject
// 使用@property定义两个属性
@property(nonatomic , weak) FKItem* item;
- (void) showItemInfo;
@end
