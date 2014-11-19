//
//  HelloWorldLayer.m
//  ActionScaleTest
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
		CCSprite* appleSprite = [CCSprite spriteWithFile:@"apple.png"];
		// 设置（苹果）精灵的位置在屏幕正中位置
		appleSprite.position = ccp(winSize.width/2, winSize.height/2);
		// 将（苹果）精灵添加到层当中
		[self addChild:appleSprite];
		// 定义2个CCScaleTo动作，每个动作都是将精灵放大2倍
//		id scaleTo1 = [CCScaleTo actionWithDuration:2.0 scale:2];
//		id scaleTo2 = [CCScaleTo actionWithDuration:2.0 scale:2];
		//（CCSequence是一个组合动作，执行完scaleTo1之后再执行scaleTo2）
		// 执行2个CCScaleTo动作，scaleTo1放大到原始大小的2倍，
		// scaleTo2也是放大到原始大小的2倍
		// 执行完后最终精灵放大到原始大小的2倍
//		[appleSprite runAction:[CCSequence actions:scaleTo1,scaleTo2, nil]];
		// 定义2个CCScaleBy动作
		id scaleBy1 = [CCScaleBy actionWithDuration:2.0 scale:2];
		id scaleBy2 = [CCScaleBy actionWithDuration:2.0 scale:2];
		// 执行2个CCScaleBy动作，scaleBy1放大到当前大小（第一次是原始大小）的2倍
		// scaleBy2放大到当前大小（已经放大过后）的2倍
		[appleSprite runAction:[CCSequence actions:scaleBy1,scaleBy2, nil]];
	}
	return self;
}


@end
