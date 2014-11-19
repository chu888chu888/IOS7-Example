//
//  HelloWorldLayer.m
//  HelloWorld
//
//  Created by Jason on 13-10-12.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "SimpleAudioEngine.h"

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
	if( (self=[super init]) ) {
		// 创建和初始化一个标签对象。
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World"
		       fontName:@"Marker Felt" fontSize:64];
		// 实例化得到一个CCDirector的单例,并获得窗口的尺寸
		CGSize size = [[CCDirector sharedDirector] winSize];
		// 将标签位置设置在屏幕中央,ccp是cocos2d对于CGPointMake的宏定义
		label.position = ccp( size.width /2 , size.height/2 );
		// 将label添加为scene的子节点
		[self addChild: label];
		// 下面是初始化游戏中心的成就榜和高分榜的代码,此处先略去暂时不讨论
	}
	return self;
}


// on "dealloc" you need to release all your retained objects

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
