//  Created by yeeku on 2013-4-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKOutput.h"
#import "FKProductable.h"

// 定义协议，继承了FKOutput、FKProductable两个协议
@protocol FKPrintable <FKOutput , FKProductable>
@required
// 定义协议的方法
- (NSString*) printColor;
@end
