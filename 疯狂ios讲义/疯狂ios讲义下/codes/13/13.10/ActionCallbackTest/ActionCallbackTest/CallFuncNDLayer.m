//
//  CallFuncNDLayer.m
//  ActionCallbackTest
//
//  Created by Jason on 13-9-3.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "CallFuncNDLayer.h"


@implementation CallFuncNDLayer
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	// 'layer' is an autorelease object.
	CallFuncNDLayer *layer = [CallFuncNDLayer node];
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
		// 执行CCCallFuncND动作，传递两个参数，第一个是调用动作的节点对象，
		// 第二个是自定义是数据
		[planeSprite runAction:[CCCallFuncND 
			actionWithTarget:self selector:@selector(move:data:) data:(void*)2]];
	}
	return self;
}
-(void) move:(id)sender data:(void*)delta{
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    // 参数sender就是调用动作的节点对象
    CCNode* node = (CCNode*)sender;
    // CCMoveTo动作，5秒钟从屏幕左边移动到右边
    id moveTo = [CCMoveTo actionWithDuration:5
         position:ccp(winSize.width-node.contentSize.width/2, winSize.height/2)];
    // CCSequence组合动作，延迟动作的时间是传进来的第二个参数delta，
    id action = [CCSequence actions:
        [CCDelayTime actionWithDuration:(NSInteger)delta],moveTo, nil];
    // 执行CCSequence组合动作
    [node runAction:action];
}
@end
