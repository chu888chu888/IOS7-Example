//
//  CallFuncNLayer.m
//  ActionCallbackTest
//
//  Created by Jason on 13-9-3.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "CallFuncNLayer.h"


@implementation CallFuncNLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	// 'layer' is an autorelease object.
	CallFuncNLayer *layer = [CallFuncNLayer node];
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
		[self addChild:planeSprite ];
		// CCMoveTo动作，5秒钟从屏幕左边移动到右边
		id moveTo = [CCMoveTo actionWithDuration:5
			position:ccp(winSize.width-planeSprite.contentSize.width/2, winSize.height/2)];
		// CCSequence组合动作，延迟2秒后，执行CCCallFuncN动作调用move方法
		id sequence = [CCSequence actions:
			[CCDelayTime actionWithDuration:2.0],
			[CCCallFuncN actionWithTarget:self selector:@selector(move:)], nil];
		// 定义了一个CCSpawn组合动作，同时执行moveTo动作和sequence组合动作
		id action = [CCSpawn actions:moveTo,sequence, nil];
		// 执行CCSpawn组合动作
		[planeSprite runAction:action];
	}
	return self;
}
-(void) move:(id)sender{
    //参数sender就是调用动作的节点对象
    CCNode* node = (CCNode*)sender;
    //停止节点对象的所有动作
    [node stopAllActions];
}
@end
