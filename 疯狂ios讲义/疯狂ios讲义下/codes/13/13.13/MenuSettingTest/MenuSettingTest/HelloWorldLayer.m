//
//  HelloWorldLayer.m
//  MenuSettingTest
//
//  Created by Jason on 13-9-25.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "SimpleAudioEngine.h"
#import "SettingLayer.h"

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
		// 创建”播放背景音乐“标签，当触碰标签时，调用playBackgroundMusic方法
		CCMenuItemFont* playItem = [CCMenuItemFont itemWithString:@"播放背景音乐"
			target:self selector:@selector(playBackgroundMusic:)];
		// 设置“播放背景音乐”标签位置
		playItem.position=ccp(winSize.width/2, winSize.height*0.6);
		// 创建“设置”标签，当触碰标签时，调用setting方法
		CCMenuItemFont* settingItem = [CCMenuItemFont itemWithString:@"设置"
			target:self selector:@selector(setting:)];
		// 设置“设置”标签位置
		settingItem.position=ccp(winSize.width/2, winSize.height*0.4);
		// 创建控制菜单，并将两个标签添加进去
		CCMenu* menu = [CCMenu menuWithItems:playItem,settingItem, nil];
		menu.position = CGPointZero;
		[self addChild:menu];
	}
	return self;
}
// 播放背景音乐的方法
-(void) playBackgroundMusic :(id)sender{
	[[SimpleAudioEngine sharedEngine] playBackgroundMusic:
		@"bgmusic.mp3" loop:YES];
}
// 设置音效方法
-(void) setting :(id)sender{
	// 停止背景音乐
	[[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
	// 切换到SettingLayer场景
	CCTransitionSlideInL* transitionScene = [CCTransitionSlideInL
		transitionWithDuration:2.0 scene:[SettingLayer scene]];
	[[CCDirector sharedDirector] replaceScene:transitionScene];
}

@end
