//
//  MenuLayer.m
//  Airfight
//
//  Created by Jason on 13-9-13.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "MenuLayer.h"
#import "SimpleAudioEngine.h"
#import "PreloadLayer.h"
#import "SettingLayer.h"


@implementation MenuLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MenuLayer *layer = [MenuLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super init]) ) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		// 创建“开始游戏”标签，当触碰标签时，调用startGame:方法
		CCMenuItemFont* startItem = [CCMenuItemFont itemWithString:@"开始游戏"
															target:self selector:@selector(startGame:)];
		startItem.position=ccp(winSize.width/2, winSize.height*0.6);
		// 创建“游戏设置”标签，当触碰标签时，调用setting方法
		CCMenuItemFont* settingItem = [CCMenuItemFont itemWithString:@"游戏设置"
															  target:self selector:@selector(setting:)];
		// 设置“游戏设置”标签位置
		settingItem.position=ccp(winSize.width/2, winSize.height*0.4);
		// 创建控制菜单，并将两个标签添加进去
		CCMenu* menu = [CCMenu menuWithItems:startItem,settingItem, nil];
		menu.position = CGPointZero;
		[self addChild:menu];
	}
	return self;
}

//播放背景音乐的方法
-(void) startGame:(id)sender{
	// 切换到PreloadLayer场景
	CCTransitionSlideInL* transitionScene = [CCTransitionSlideInL
		transitionWithDuration:2.0 scene:[PreloadLayer scene]];
	[[CCDirector sharedDirector] replaceScene:transitionScene];
}

//设置音效方法
-(void) setting:(id)sender{
	// 切换到SettingLayer场景
	CCTransitionSlideInL* transitionScene = [CCTransitionSlideInL
		transitionWithDuration:2.0 scene:[SettingLayer scene]];
	[[CCDirector sharedDirector] replaceScene:transitionScene];
}

@end
