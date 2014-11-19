//  Created by yeeku on 2013-3-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

@interface FKDog : NSObject
// 定义一个jump方法
- (void) jump;
// 定义一个run方法，run方法需要借助jump方法
- (void) run;
@end
