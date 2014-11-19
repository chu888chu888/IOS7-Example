//  Created by yeeku on 2013-4-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 定义协议
@protocol FKOutput
// 定义协议的方法
@optional
- (void) output;
@required
- (void) addData: (NSString*) msg;
@end
