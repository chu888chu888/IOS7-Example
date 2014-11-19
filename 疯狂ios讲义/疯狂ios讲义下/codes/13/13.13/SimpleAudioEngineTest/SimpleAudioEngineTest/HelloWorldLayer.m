//
//  HelloWorldLayer.m
//  SimpleAudioEngineTest
//
//  Created by Jason on 13-9-25.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "SimpleAudioEngine.h"

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
	if( (self=[super init]) ) 
	{
		CGSize winSzie = [[CCDirector sharedDirector] winSize];
		// 创建一个标签
		CCLabelBMFont* label = [CCLabelBMFont
			labelWithString:@"playBackgroundMusic" fntFile:@"menu.fnt"];
		label.position = ccp(winSzie.width/2, winSzie.height/2);
		[self addChild:label];
		// 播放背景音乐
		[[SimpleAudioEngine sharedEngine] 
			playBackgroundMusic:@"bgmusic.mp3" loop:YES];
	}
	return self;
}
@end
