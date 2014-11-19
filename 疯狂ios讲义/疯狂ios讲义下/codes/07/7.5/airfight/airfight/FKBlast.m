//
//  FKBlast.m
//  airfight
//
//  Created by yeeku on 13-9-11.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKBlast.h"

@implementation FKBlast
- (id)initWithLayer:(CALayer*)layer imageIndex:(NSInteger)imageIndex
{
    self = [super init];
    if (self) {
        _layer = layer;
		_imageIndex = imageIndex;
    }
    return self;
}
@end
