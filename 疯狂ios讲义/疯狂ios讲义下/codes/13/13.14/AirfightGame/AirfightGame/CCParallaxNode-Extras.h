//
//  CCParallaxNode-Extras.h
//  Test1
//
//  Created by Jason on 13-9-20.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface CCParallaxNode (Extras)

-(void) incrementOffset:(CGPoint)offset forChild:(CCNode*)node;

-(void) incrementOffset:(CGPoint)offset atIndex:(int)index;

-(void) setParallaxNode:(CCNode*)node atPos:(CGPoint)pt;


@end
