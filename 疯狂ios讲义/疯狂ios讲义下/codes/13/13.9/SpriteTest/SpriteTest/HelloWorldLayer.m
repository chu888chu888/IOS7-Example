//
//  HelloWorldLayer.m
//  SpriteTest
//
//  Created by Jason on 13-10-12.
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
	// 创建CCScene场景对象
	CCScene *scene = [CCScene node];
	// 创建HelloWorldLayer层对象
	HelloWorldLayer *layer = [HelloWorldLayer node];
	// 将layer添加为scene的子节点
	[scene addChild: layer];
	// 返回scene对象
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	if((self=[super init]) ) {
		// 获得设备支持的窗口大小
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		// 使用背景图片gamebg.png创建一个精灵对象，初始位置偏移是（0，0）。
		CCSprite* bgSprite = [CCSprite spriteWithFile:@"gamebg.png"];
		// 设置背景图片位置为屏幕正中
		// bgSprite.position = CGPointMake(winSize.width/2, winSize.height/2);
		bgSprite.position = ccp(winSize.width/2, winSize.height/2);
		// 把背景图片精灵添加到HelloWorldLayer中。
		[self addChild:bgSprite];
		// 使用图片z_00_01.png创建一个僵尸精灵对象，初始位置偏移是（0，0）。
		CCSprite* zSprite = [CCSprite spriteWithFile:@"z_00_01.png"];
		// 设置僵尸精灵图片位置为屏幕正中
		zSprite.position = ccp(winSize.width/2, winSize.height/2);
		// 把僵尸图片精灵添加到MainLayer中。
		[self addChild:zSprite];
	}
	return self;
}

@end
