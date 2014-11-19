//
//  SettingLayer.m
//  AudioSettingTest
//
//  Created by Jason on 13-9-10.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "SettingLayer.h"
#import "HelloWorldLayer.h"
#import "CDAudioManager.h"


@implementation SettingLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SettingLayer *layer = [SettingLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super init]) ) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		// 提示菜单项
		CCMenuItemFont* musicItem = [CCMenuItemFont itemWithString:@"背景音乐："];
		musicItem.position = ccp(winSize.width*0.4, winSize.height*0.6);
		// 创建“开”和“关”菜单项
		CCMenuItemFont* musicOn = [CCMenuItemFont itemWithString:@"开"];
		CCMenuItemFont* musicOff = [CCMenuItemFont itemWithString:@"关"];
		// CCMenuItemToggle,默认显示 开  开=0  关=1
		CCMenuItemToggle* musicToggle = [CCMenuItemToggle itemWithTarget:self
			selector:@selector(change:) items:musicOff,musicOn, nil];
		musicToggle.position = ccp(winSize.width*0.7, winSize.height*0.6);
		// 创建“返回主菜单“菜单项
		CCMenuItemFont* returnItem = [CCMenuItemFont itemWithString:@"返回主菜单"
			target:self selector:@selector(backToMainLayer:)];
		returnItem.position = ccp(winSize.width/2, winSize.height*0.4);
		// 创建控制菜单，并将三个标签添加进去
		CCMenu* menu = [CCMenu menuWithItems:musicItem,musicToggle,returnItem, nil];
		menu.position = CGPointZero;
		[self addChild:menu];
		// NSUserDefaults用户首选项可以用来保存和记录用户在操作应用的过程中做出的一些选择或设置。
		NSUserDefaults* userDef = [NSUserDefaults standardUserDefaults];
		// 如果Bool为No，则显示1=关
		if([userDef boolForKey:@"music"] == NO){
			musicToggle.selectedIndex = 1;
		}
	}
	return self;
}

-(void) change:(id)sender{
	// 判断mute（静音）属性，根据属性状态进行切换
	if([CDAudioManager sharedManager].mute == TRUE){
		[CDAudioManager sharedManager].mute = FALSE;
	}else{
		[CDAudioManager sharedManager].mute = TRUE;
	}
	NSUserDefaults* userDef = [NSUserDefaults standardUserDefaults];
	CCMenuItemToggle* tooggle = (CCMenuItemToggle*)sender;
	// 关=1 设置Bool为NO
	if(tooggle.selectedIndex == 1){
		[userDef setBool:NO forKey:@"music"];
	}else{
		[userDef setBool:YES forKey:@"music"];
	}
}
// 定义一个CCTransitionSlideInL场景切换效果，并使用CCDirector单例对象来切换场景
-(void) backToMainLayer :(id)sender{
	CCTransitionSlideInL* transitionScene = [CCTransitionSlideInL 
	transitionWithDuration:2.0 scene:[HelloWorldLayer scene]];
	[[CCDirector sharedDirector] replaceScene:transitionScene];
}

@end
