//
//  HelloWorldLayer.m
//  ActionEaseTest
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
		danceSprite.position = ccp(danceSprite.contentSize.width/2,
			danceSprite.contentSize.height/2);
		CCSprite* sister1Sprite = [CCSprite spriteWithFile:@"sister1.png"];
		sister1Sprite.position = ccp(danceSprite.contentSize.width/2,
			danceSprite.contentSize.height*1.5);
		CCSprite* sister2Sprite = [CCSprite spriteWithFile:@"sister2.png"];
		sister2Sprite.position = ccp(danceSprite.contentSize.width/2,
			danceSprite.contentSize.height*2.5);
		[self addChild:danceSprite];
		[self addChild:sister1Sprite];
		[self addChild:sister2Sprite];
		// 3秒移动到屏幕右边特定的位置
		id moveTo1 = [CCMoveTo actionWithDuration:3 position:ccp(winSize.width-danceSprite.contentSize.width/2, danceSprite.contentSize.height/2)];
		// CCEaseBounceIn 由慢到快
		id easeIn = [CCEaseIn actionWithAction:moveTo1 rate:2.5f];
		[danceSprite runAction:easeIn];
		// 3秒移动到屏幕右边特定的位置
		id moveTo2 = [CCMoveTo actionWithDuration:3 position:ccp(winSize.width-danceSprite.contentSize.width/2, danceSprite.contentSize.height*1.5)];
		// CCEaseBackOut 由快到慢
		id easeOut = [CCEaseOut actionWithAction:moveTo2 rate:2.5f];
		[sister1Sprite runAction:easeOut];
		// 3秒移动到屏幕右边特定的位置
		id moveTo3 = [CCMoveTo actionWithDuration:3 position:ccp(winSize.width-danceSprite.contentSize.width/2, danceSprite.contentSize.height*2.5)];
		// CCEaseBackInOut 先由慢到快，再由快到慢
		id easeInOut = [CCEaseInOut actionWithAction:moveTo3 rate:2.5f];
		[sister2Sprite runAction:easeInOut];
	}
	return self;
}
@end
