//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

@interface FKApple : NSObject
@property (nonatomic , copy) NSString* color;
@property (nonatomic , assign) double weight;
- (id) initWithColor: (NSString*) color weight: (double) weight;
@end