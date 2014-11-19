//
//  CCCallBlockOLayer.m
//  ActionBlockTest
//
//  Created by Jason on 13-9-4.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "CallBlockOLayer.h"


@implementation CallBlockOLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	CallBlockOLayer *layer = [CallBlockOLayer node];
	
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
		// CCSpawn组合动作，CCCallBlockO可以传递一个对象参数，这里传递的是炮火精灵对象
		id action = [CCSpawn actions:moveTo, [CCCallBlockO actionWithBlock:
			^(id object){
				// object:传入的精灵对象或者其他id类型的数据，
				// 这里传入的object是接下来的object:fireSprite
				CCNode *node = (CCNode*) object;
				[node runAction:[CCMoveTo actionWithDuration:5
				position:ccp(winSize.width-node.contentSize.width/2, winSize.height/2+100)]];
			} object:fireSprite], nil];
		// 飞机精灵执行CCSpawn组合动作
		[planeSprite runAction:action];
	}
	return self;
}

@end
