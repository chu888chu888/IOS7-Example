//
//  CallFuncOLayer.m
//  ActionCallbackTest
//
//  Created by Jason on 13-9-3.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "CallFuncOLayer.h"


@implementation CallFuncOLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	// 'layer' is an autorelease object.
	CallFuncOLayer *layer = [CallFuncOLayer node];
	// add layer as a child to scene
	[scene addChild: layer];
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super init]) ) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		// 飞机精灵
		CCSprite* planeSprite = [CCSprite spriteWithFile:@"plane.png"];
		planeSprite.position = ccp(planeSprite.contentSize.width/2, winSize.height/2-100);
		[self addChild:planeSprite];
		// 炮火精灵
		CCSprite* fireSprite = [CCSprite spriteWithFile:@"fire.png"];
		fireSprite.position = ccp(fireSprite.contentSize.width/2, winSize.height/2+100);
		[self addChild:fireSprite];
		// CCMoveTo动作，5秒钟从屏幕左边移动到右边
		id moveTo = [CCMoveTo actionWithDuration:5
		position:ccp(winSize.width-planeSprite.contentSize.width/2, winSize.height/2-100)];
		// CCSpawn组合动作，CCCallFuncO可以多传递一个对象参数，这里传递的是炮火精灵对象
		id action = [CCSpawn actions:moveTo,[CCCallFuncO actionWithTarget:self selector:@selector(move:object:) object:fireSprite], nil];
		// 飞机精灵执行CCSpawn组合动作
		[planeSprite runAction:action];
	}
	return self;
}

-(void) move:(id)sender object:(id)object{
	CGSize winSize = [[CCDirector sharedDirector] winSize];
	//传递进来的对象执行CCMoveTo动作
	CCNode* node = (CCNode*)object;
	[node runAction:[CCMoveTo actionWithDuration:5 position:
		ccp(winSize.width-node.contentSize.width/2, winSize.height/2+100)]];
}

@end
