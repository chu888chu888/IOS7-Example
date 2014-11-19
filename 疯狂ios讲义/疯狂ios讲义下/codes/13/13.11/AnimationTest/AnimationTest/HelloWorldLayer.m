//
//  HelloWorldLayer.m
//  AnimationTest
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
		CCSprite* bgSprite = [CCSprite spriteWithFile:@"gamebg.png"];
		bgSprite.position = ccp(winSize.width/2, winSize.height/2);
		[self addChild:bgSprite];
		// 创建僵尸精灵，并设置坐标位置在屏幕之外
		CCSprite* zSprite = [CCSprite spriteWithFile:@"z_00_01.png"];
		zSprite.position = ccp(winSize.width+zSprite.contentSize.width/2
			, winSize.height/2);
		[self addChild:zSprite];
		// 创建CCAnimation动画，指定动画帧的内容
		CCAnimation* anim = [CCAnimation animation];
		[anim addSpriteFrameWithFilename:@"z_00_01.png"];
		[anim addSpriteFrameWithFilename:@"z_00_02.png"];
		[anim addSpriteFrameWithFilename:@"z_00_03.png"];
		[anim addSpriteFrameWithFilename:@"z_00_04.png"];
		[anim addSpriteFrameWithFilename:@"z_00_05.png"];
		[anim addSpriteFrameWithFilename:@"z_00_06.png"];
		[anim addSpriteFrameWithFilename:@"z_00_07.png"];
		[anim addSpriteFrameWithFilename:@"z_00_08.png"];
		// 创建animAction动画，restoreOriginalFrame:YES
		// 可以让精灵对象在动画执行完后恢复到最初状态
		id animAction = [CCAnimate actionWithDuration:1.5f animation:anim 
			restoreOriginalFrame:YES];
		// 定义一个动作，重复执行CCAnimate动画
		id repeatanimAction = [CCRepeatForever actionWithAction:animAction];
		// 定义一个动作，让精灵对象移动到特定的位置
		id moveTo = [CCMoveTo actionWithDuration:10.0f
			position:ccp(-zSprite.contentSize.width/2, winSize.height/2)];
		// 僵尸精灵重复执行动画动作和移动动作
		[zSprite runAction:repeatanimAction];
		[zSprite runAction:moveTo];

	}
	return self;
}

@end
