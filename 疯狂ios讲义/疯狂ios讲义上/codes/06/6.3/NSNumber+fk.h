//  Created by yeeku on 2013-4-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 定义一个类别
@interface NSNumber (fk)
// 在类别中定义4个方法
- (NSNumber*) add: (double) num2;
- (NSNumber*) substract: (double) num2;
- (NSNumber*) multiply: (double) num2;
- (NSNumber*) divide: (double) num2;
@end
