//  Created by yeeku on 2013-4-6.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

@interface VarArgs : NSObject
// 定义形参个数可变的方法
- (void)test:(NSString *) name, ...;
@end