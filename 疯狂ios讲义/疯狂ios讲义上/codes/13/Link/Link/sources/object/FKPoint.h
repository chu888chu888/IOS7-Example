//
//  FKPoint.h
//  Link
//
//  Created by yeeku on 13-7-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <Foundation/Foundation.h>
// 定义一个代表屏幕上点的FKPoint，它包含x、y两个属性
@interface FKPoint : NSObject <NSCopying>
@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;
- (id)initWithX:(NSInteger)x y:(NSInteger)y;
@end
