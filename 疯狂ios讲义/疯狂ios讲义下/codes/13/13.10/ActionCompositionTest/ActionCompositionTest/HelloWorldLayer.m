//
//  HelloWorldLayer.m
//  ActionCompositionTest
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
		appleSprite.position = ccp(winSize.width/2, winSize.height/2);
		[self addChild:appleSprite];

		id fadeIn = [CCFadeIn actionWithDuration:2];
		id scaleTo = [CCScaleTo actionWithDuration:2 scale:2];
		id action = [CCSpawn actions:fadeIn,scaleTo, nil];
		[appleSprite runAction:action];
	}
	return self;
}
@end
