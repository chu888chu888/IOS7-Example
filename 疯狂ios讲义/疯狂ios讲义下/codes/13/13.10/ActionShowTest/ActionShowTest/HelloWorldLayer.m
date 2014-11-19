//
//  HelloWorldLayer.m
//  ActionShowTest
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
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		CCSprite* appleSprite = [CCSprite spriteWithFile:@"apple.png"];
		appleSprite.position = ccp(winSize.width/2, winSize.height/2);
		// 设置visible=NO，即精灵不可见
		appleSprite.visible = NO;
		[self addChild:appleSprite];
		// 定义一个CCShow动作
		id show = [CCShow action];
		// 执行动作，则（苹果）精灵立即可见
		[appleSprite runAction:show];
		// 定义一个CCHide动作
		id hide = [CCHide action];
		// 执行动作，则（苹果）精灵立即隐藏
		[appleSprite runAction:hide];
		// CCToggleVisibility动作切换节点的可见属性，则（苹果）精灵又变成可见
		[appleSprite runAction:[CCToggleVisibility action]];
		// （苹果）精灵对象在5秒内闪动5次
		[appleSprite runAction:[CCBlink actionWithDuration:5.0 blinks:5]];
	}
	return self;
}
@end
