//
//  FKBlast.h
//  airfight
//
//  Created by yeeku on 13-9-11.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface FKBlast : NSObject
@property (nonatomic, strong) CALayer* layer;
@property (nonatomic, assign) NSInteger imageIndex;
- (id)initWithLayer:(CALayer*)layer imageIndex:(NSInteger)imageIndex;
@end
