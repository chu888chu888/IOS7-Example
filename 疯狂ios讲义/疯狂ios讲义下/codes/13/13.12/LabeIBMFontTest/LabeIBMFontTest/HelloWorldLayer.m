//
//  HelloWorldLayer.m
//  LabeIBMFontTest
//
//  Created by Jason on 13-9-25.
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
		// 创建一个标签，使用my.fnt字体图集
		CCLabelBMFont *label = [CCLabelBMFont labelWithString:@"Hello BMFont" 
			fntFile:@"my.fnt"];
		label.position = ccp(winSize.width/2, winSize.height/2);
		[self addChild:label];
		// CCScaleBy动作，2秒后放大2倍
		id scaleBy = [CCScaleBy actionWithDuration:2.0f scale:2];
		[label runAction:scaleBy];

	}
	return self;
}

@end
