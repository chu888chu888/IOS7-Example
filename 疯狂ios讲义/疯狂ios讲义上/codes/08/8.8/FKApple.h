//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 定义FKApple类，实现NSCoding协议
@interface FKApple : NSObject <NSCoding>
@property (nonatomic , copy) NSString* color;
@property (nonatomic , assign) double weight;
@property (nonatomic , assign) int size;
- (id) initWithColor: (NSString*) color
	weight: (double) weight size: (int) size;
@end