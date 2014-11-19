//
//  HelloWorldLayer.m
//  ActionMoveTest
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
		
		// 获得设备支持的窗口大小
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		// 通过plane.png文件创建一个飞机精灵
		CCSprite* planeSprite = [CCSprite spriteWithFile:@"plane.png"];
		// 设置飞机精灵的X轴为屏幕中心-180，即屏幕最左边，Y轴为屏幕中心高度
		planeSprite.position = ccp(winSize.width/2-180, winSize.height/2);
		// 将飞机精灵添加到层当中
		[self addChild:planeSprite];
		// 定义一个CCMoveTo动作，2秒内从当前位置移动到像素(360,160)的位置
		id moveTo = [CCMoveTo actionWithDuration:2.0 position:ccp(360, 160)];
		// 飞机精灵运行该动作
		[planeSprite runAction:moveTo];
		// 在控制台打印移动的像素值
		// CCLOG(@"width: %f,height: %f",winSize.width/2,winSize.height/2);
		// 定义一个CCMoveBy动作，精灵对象将在2秒内从原位置向右移动360像素，向上移动160像素。
		// id moveBy = [CCMoveBy actionWithDuration:2.0 position:ccp(360, 160)];
		// 飞机精灵运行该动作
		// [planeSprite runAction:moveBy];
	}
	return self;
}
@end
