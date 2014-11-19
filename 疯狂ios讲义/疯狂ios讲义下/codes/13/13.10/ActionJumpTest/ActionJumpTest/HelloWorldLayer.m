//
//  HelloWorldLayer.m
//  ActionJumpTest
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
		// 读取ball.png创建一个精灵对象（球）
		CCSprite* ballSprite = [CCSprite spriteWithFile:@"ball.png"];
		/**
		contentSize是父类CCNode的属性,为节点大小。
		无论节点如何缩放或旋转,contentSize属性值始终不变
		这里设置（球）精灵坐标(0+球宽度/2,屏幕高度/2)，因为CCNode的position属性是相对于描点的,
		而描点位于纹理图像的几何中心,这里如果X轴设置成0，则（球）精灵只会显示一半了
		*/
		ballSprite.position = ccp(0+ballSprite.contentSize.width/2, winSize.height/2);
		// 将（球）精灵添加到层当中
		[self addChild:ballSprite];
		// 定义一个jumpTo动作，精灵对象将在5秒之内从原位置以2次跳跃动作移动到屏幕的指定位置
		id jumpTo = [CCJumpTo actionWithDuration:5.0
			position:ccp(winSize.width-ballSprite.contentSize.width/2
			, winSize.height/2) height:50 jumps:2];
		//（球）精灵运行该动作
		[ballSprite runAction:jumpTo];
//		id jumpBy = [CCJumpBy actionWithDuration:5.0 
//			position:ccp(winSize.width-ballSprite.contentSize.width/2
//			, winSize.height/2) height:50 jumps:2];
		//（球）精灵运行该动作
//		[ballSprite runAction:jumpBy];
	}
	return self;
}
@end
