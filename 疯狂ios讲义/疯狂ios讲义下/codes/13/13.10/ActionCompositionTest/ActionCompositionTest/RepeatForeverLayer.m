//
//  RepeatForeverLayer.m
//  ActionCompositionTest
//
//  Created by Jason on 13-9-3.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "RepeatForeverLayer.h"


@implementation RepeatForeverLayer
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	RepeatForeverLayer *layer = [RepeatForeverLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init{
	if( (self=[super init]) ) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		CCSprite* ballSprite = [CCSprite spriteWithFile:@"ball.png"];
		// 初始位置在屏幕左边居中位置
		ballSprite.position = ccp(0, winSize.height/2);
		[self addChild:ballSprite];
		// 每2秒向右边移动50像素
		id moveBy = [CCMoveBy actionWithDuration:2 position:ccp(50,0)];
		[ballSprite runAction:[CCRepeatForever actionWithAction:moveBy]];
	}
	return self;
}
@end
