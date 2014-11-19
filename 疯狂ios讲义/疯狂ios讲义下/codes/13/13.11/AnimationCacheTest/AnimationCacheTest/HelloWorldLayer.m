//
//  HelloWorldLayer.m
//  AnimationCacheTest
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
		// ①读取plist文件将精灵帧纹理添加到精灵帧缓存当中.
		[[CCSpriteFrameCache sharedSpriteFrameCache] 
			addSpriteFramesWithFile:@"animation.plist"];
		// ②创建一个精灵表单
		CCSpriteBatchNode* batchNode = [CCSpriteBatchNode
			batchNodeWithFile:@"animation.png"];
		// ③将精灵表单做为层的子节点添加到层当中
		[self addChild:batchNode];
		// ④创建背景精灵添加到精灵表单中
		CCSprite* bgSprite = [CCSprite spriteWithSpriteFrameName:@"gamebg-hd.png"];
		bgSprite.position = ccp(winSize.width/2, winSize.height/2);
		[batchNode addChild:bgSprite];
		// ⑤创建僵尸精灵，设置坐标位置在屏幕之外
		CCSprite* zSprite = [CCSprite spriteWithSpriteFrameName:@"z_00_01.png"];
		zSprite.position = ccp(winSize.width+zSprite.contentSize.width, winSize.height/2);
		// ⑥创建一个数组用来保存动画
		NSMutableArray* array = [NSMutableArray array];
		// 遍历所有图片，然后从精灵帧缓存中获取与图片名称相对应的精灵帧保存到数组当中
		for(int i = 1 ; i<=8 ; i++) {
			NSString* fileName = [NSString stringWithFormat:@"z_00_0%i.png",i];
			CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
				spriteFrameByName:fileName];
			[array addObject:frame];
		}
		// ⑦创建一个动画并设计成重复动作
		id animation = [CCAnimation animationWithSpriteFrames:array delay:0.1f];
		id animate = [CCAnimate actionWithAnimation:animation];
		id repeate = [CCRepeatForever actionWithAction:animate];
		// ⑧创建一个CCMoveTo移动到特定的位置
		id moveTo = [CCMoveTo actionWithDuration:10.0f position:
			ccp(-zSprite.contentSize.width/2, winSize.height/2)];
		// ⑨让僵尸精灵运行动画和移动动作
		[zSprite runAction:repeate];
		[zSprite runAction:moveTo];
		// ⑩将僵尸精灵添加到精灵表单中
		[bgSprite addChild:zSprite];
	}
	return self;
}
@end
