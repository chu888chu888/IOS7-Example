//
//  FKPoint.h
//  Snake
//
//  Created by yeeku on 13-7-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKPoint : NSObject
@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;
- (id)initWithX:(NSInteger)x y:(NSInteger)y;
- (BOOL) isEqual:(FKPoint*)other;
@end
