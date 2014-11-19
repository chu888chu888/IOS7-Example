//
//  PlayLayer.m
//  SimpleAudioEngineTest
//
//  Created by Jason on 13-9-10.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "PlayLayer.h"
#import "SimpleAudioEngine.h"


@implementation PlayLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	PlayLayer *layer = [PlayLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
static NSString* fontName = @"menu.fnt";
-(id) init
{
	if( (self=[super init]) ) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		// 创建播放音乐标签
		CCLabelBMFont* palyLabel = [CCLabelBMFont
			labelWithString:@"play" fntFile:fontName];
		// 创建播放音乐的Item，当触碰时会调用playBackgroundMusic方法
		CCMenuItemLabel* playItem = [CCMenuItemLabel itemWithLabel:palyLabel
			target:self selector:@selector(playBackgroundMusic:)];
		// 创建停止音乐标签
		CCLabelBMFont* stopLabel = [CCLabelBMFont
			labelWithString:@"stop" fntFile:fontName];
		// 创建停止音乐的Item，当触碰时会调用stopBackgroundMusic方法
		CCMenuItemLabel* stopItem = [CCMenuItemLabel itemWithLabel:stopLabel
			target:self selector:@selector(stopBackgroundMusic:)];
		// 创建暂停音乐标签
		CCLabelBMFont* pauseLabel = [CCLabelBMFont
			labelWithString:@"pause" fntFile:fontName];
		// 创建暂停音乐的Item，当触碰时会调用pauseBackgroundMusic方法
		CCMenuItemLabel* pauseItem = [CCMenuItemLabel itemWithLabel:pauseLabel
			target:self selector:@selector(pauseBackgroundMusic:)];
		// 创建继续音乐标签
		CCLabelBMFont* resumeLabel = [CCLabelBMFont
			labelWithString:@"resume" fntFile:fontName];
		// 创建继续音乐的Item，当触碰时会调用resumeBackgroundMusic方法
		CCMenuItemLabel* resumeItem = [CCMenuItemLabel itemWithLabel:resumeLabel
			target:self selector:@selector(resumeBackgroundMusic:)];
		// 设置菜单Item坐标位置
		playItem.position=ccp(winSize.width/2, winSize.height*0.6);
		stopItem.position=ccp(winSize.width/2, winSize.height*0.4);
		pauseItem.position=ccp(winSize.width/2, winSize.height*0.2);
		resumeItem.position=ccp(winSize.width/2, winSize.height*0.8);
		// 创建音效标签
		CCLabelBMFont* effectLabel = [CCLabelBMFont 
			labelWithString:@"effect" fntFile:fontName];
		// 创建音效的Item，当触碰时会调用soundEffect方法
		CCMenuItemLabel *effectItem = [CCMenuItemLabel itemWithLabel:effectLabel
			target:self selector:@selector(soundEffect:)];
		// 设置菜单Item坐标位置
		effectItem.position = ccp(winSize.width*0.2, winSize.height*0.65);
		// 创建菜单，将所有Item加进去
		CCMenu* menu = [CCMenu menuWithItems:playItem,stopItem,pauseItem
			,resumeItem,effectItem, nil];
		menu.position = CGPointZero;
		[self addChild:menu];
	}
	return self;
}
// 播放背景音乐的方法
-(void) playBackgroundMusic :(id)sender{
	[[SimpleAudioEngine sharedEngine] 
	playBackgroundMusic:@"bgmusic.mp3" loop:YES];
}
// 停止背景音乐的方法
-(void) stopBackgroundMusic :(id)sender{
	[[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
}
// 暂停背景音乐的方法
-(void) pauseBackgroundMusic :(id)sender{
	[[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
}
// 继续背景音乐的方法
-(void) resumeBackgroundMusic :(id)sender{
	[[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
}
-(void) soundEffect :(id) sender{
	// pitch参数指定高音参数，pan指定OpenAL中的音源位置，
	// gain参数指定音量增益
	[[SimpleAudioEngine sharedEngine] 
	playEffect:@"effect.mp3" pitch:12.0 pan:5.0 gain:2.0];
}
@end
