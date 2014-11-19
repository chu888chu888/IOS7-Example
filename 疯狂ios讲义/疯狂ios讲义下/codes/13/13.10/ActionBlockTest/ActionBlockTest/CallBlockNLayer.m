//
//  CCCallBlockNLayer.m
//  ActionBlockTest
//
//  Created by Jason on 13-9-4.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "CallBlockNLayer.h"


@implementation CallBlockNLayer
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	CallBlockNLayer *layer = [CallBlockNLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
-(id) init
{
	if( (self=[super init]) ) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		CCSprite* planeSprite = [CCSprite spriteWithFile:@"plane.png"];
		// 初始化在屏幕中间的最左边
		planeSprite.position = ccp(planeSprite.contentSize.width/2, winSize.height/2);
		[self addChild:planeSprite];
		// CCMoveTo动作，5秒钟从屏幕左边移动到右边
		id moveTo = [CCMoveTo actionWithDuration:5 position:
			ccp(winSize.width-planeSprite.contentSize.width/2, winSize.height/2)];
		// CCSequence组合动作，延迟2秒后，执行CCCallBlockN动作，停止该节点的所有动作
		id sequence = [CCSequence actions:[CCDelayTime actionWithDuration:2.0],
			[CCCallBlockN actionWithBlock:^(CCNode* node){
			[node stopAllActions];
		}], nil];
		// 定义了一个CCSpawn组合动作，同时执行moveTo动作和sequence组合动作
		id action = [CCSpawn actions:moveTo,sequence, nil];
		// 执行CCSpawn组合动作
		[planeSprite runAction:action];
	}
    return self;
}
@end
