//
//  HelloWorldLayer.m
//  SpriteSheetTest
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
		// 获取精灵帧缓存的单例对象。
		CCSpriteFrameCache* spriteFrameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
		// ①addSpriteFramesWithFile方法从plist属性文件中添加多个精灵帧。
		// 纹理将会被自动载入，纹理的扩展名使用.png替代.plist。
		[spriteFrameCache addSpriteFramesWithFile:@"SpriteSheet.plist"];
		// ②使用SpriteSheet.png图片文件创建一个CCSpriteBatchNode精灵表单
		CCSpriteBatchNode *batchNode = [CCSpriteBatchNode batchNodeWithFile:@"SpriteSheet.png"];
		batchNode.position = CGPointZero;
		// 将精灵表单作为子节点添加到层
		[self addChild:batchNode];
		// ③使用精灵帧的名称创建一个精灵帧。（背景）
		CCSpriteFrame* bgSpriteFrame = [spriteFrameCache spriteFrameByName:@"gamebg-hd.png"];
		// 使用精灵帧创建一个精灵
		CCSprite* bgSprite = [CCSprite spriteWithSpriteFrame:bgSpriteFrame];
		// 设置背景精灵居中
		bgSprite.position = ccp(winSize.width/2, winSize.height/2);
		//将背景精灵作为子节点添加到精灵表单中
		[batchNode addChild:bgSprite];
		// ④使用精灵帧创建一个精灵（豌豆）
		CCSprite* plantSprite = [CCSprite spriteWithSpriteFrame:
			[spriteFrameCache spriteFrameByName:@"plant.png"]];
		// 设置背景精灵居中,X轴居中-100
		plantSprite.position= ccp(winSize.width/2-100, winSize.height/2);
		// 将豌豆精灵作为子节点添加到精灵表单中
		[batchNode addChild:plantSprite];
		// ⑤使用精灵帧的名称创建一个精灵（僵尸）
		CCSprite* zSprite = [CCSprite spriteWithSpriteFrame:
			[spriteFrameCache spriteFrameByName:@"z_00_01.png"]];
		// 设置背景精灵居中,X轴居中+100
		zSprite.position= ccp(winSize.width/2+100, winSize.height/2);
		[batchNode addChild:zSprite];
	}
	return self;
}

@end
