//
//  HelloWorldLayer.m
//  ActionRotateTest
//
//  Created by Jason on 13-9-24.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		CCSprite* danceSprite = [CCSprite spriteWithFile:@"dance.png"];
		// 设置（舞蹈）精灵在屏幕居中位置
		danceSprite.position = ccp(winSize.width/2, winSize.height/2);
		[self addChild:danceSprite];
		// 定义第一个CCRotateBy旋转动作，2秒之内从原始状态旋转45度
		// CCRotateTo* rotateTo1 = [CCRotateTo actionWithDuration:2 angle:45];
		// 定义第二个CCRotateBy旋转动作，2秒之内从原始状态旋转90度
		// CCRotateTo* rotateTo2 = [CCRotateTo actionWithDuration:2 angle:90];
		// 定义一个组合动作，将以上两个动作顺序执行
		// CCAction* action = [CCSequence actions:rotateTo1,rotateTo2, nil];
		// 定义第一个CCRotateBy旋转动作，2秒之内从当前状态旋转45度
		CCRotateBy* rotateBy1 = [CCRotateBy actionWithDuration:2 angle:45];
		// 定义第二个CCRotateBy旋转动作，2秒之内从当前状态旋转90度
		CCRotateBy* rotateBy2 = [CCRotateBy actionWithDuration:2 angle:90];
		// 定义一个组合动作，将以上两个动作顺序执行
		CCAction* action = [CCSequence actions:rotateBy1,rotateBy2, nil];
		// 执行组合动作
		[danceSprite runAction:action];
	}
	return self;
}


@end
