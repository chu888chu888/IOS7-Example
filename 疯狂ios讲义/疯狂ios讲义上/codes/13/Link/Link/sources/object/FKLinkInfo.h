//
//  FKLinkInfo.h
//  Link
//
//  Created by yeeku on 13-7-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FKPoint.h"

@interface FKLinkInfo : NSObject
// 定义一个NSMutableArray 用于保存连接点
@property (nonatomic ,strong) NSMutableArray * points;
- (id)initWithP1:(FKPoint*)p1 p2:(FKPoint*)p2;
- (id)initWithP1:(FKPoint*)p1 p2:(FKPoint*)p2 p3:(FKPoint*)p3;
- (id)initWithP1:(FKPoint*)p1 p2:(FKPoint*)p2 p3:(FKPoint*)p3 p4:(FKPoint*)p4;
@end
