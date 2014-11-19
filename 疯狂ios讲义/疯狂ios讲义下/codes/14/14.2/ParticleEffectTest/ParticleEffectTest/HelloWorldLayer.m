//
//  HelloWorldLayer.m
//  ParticleEffectTest
//
//  Created by Jason on 13-9-22.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "MyParticle.h"

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
	if( (self=[super init]) ) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];

//		CCParticleSystemQuad* water = [CCParticleSystemQuad 
//			particleWithFile:@"water.plist"];
//		water.position = ccp(winSize.width/2, 100);
//		[self addChild:water];

		// 创建自己定制的粒子系统
		MyParticle* myParticle = [MyParticle node];
		// 设置粒子系统的位置
		myParticle.position = ccp(winSize.width/2, winSize.height/2);
		// 将粒子系统添加到当前层的子节点
		[self addChild:myParticle];

		
// 		// 创建爆炸粒子系统
// 		CCParticleExplosion* explosion = [CCParticleExplosion node];
//		// 设置爆炸粒子系统的位置
//		explosion.position = ccp(winSize.width/2, winSize.height/2);
//		// 将爆炸粒子系统添加到当前层的子节点
//		[self addChild:explosion];
		
//		// 创建流星粒子系统
//		CCParticleMeteor* meteor = [CCParticleMeteor node];
//		// 设置流星粒子系统的位置
//		meteor.position = ccp(winSize.width/2, winSize.height/2);
//		// 将流星粒子系统添加到当前层的子节点
//		[self addChild:meteor];
	}
	return self;
}

@end
