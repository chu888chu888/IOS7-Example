//
//  RepeatLayer.m
//  ActionCompositionTest
//
//  Created by Jason on 13-9-3.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "RepeatLayer.h"


@implementation RepeatLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	RepeatLayer *layer = [RepeatLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init{
    if( (self=[super init]) ) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		CCSprite* appleSprite = [CCSprite spriteWithFile:@"apple.png"];
        appleSprite.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:appleSprite];
        //2秒淡入
        id fadeIn = [CCFadeIn actionWithDuration:2];
        //2秒闪动3次
        id blink = [CCBlink actionWithDuration:2 blinks:3];
        //组合动作
        id action = [CCSequence actions:fadeIn,blink, nil];
        //重复组合动作3次
        [appleSprite runAction:[CCRepeat actionWithAction:action times:3]];
	}
	return self;
}

@end
