//
//  HelloWorldLayer.m
//  LabelTTFTest
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
	if( (self=[super init]) ) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		// 使用特定的文本内容,字体名称和字体大小三个参数创建并初始化一个新的标签对象
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" 
			fontName:@"Marker Felt" fontSize:64];
		label.position = ccp(winSize.width/2, winSize.height/2);
		[self addChild:label];
		// iOS支持的所有字体
		NSArray *fontFamilyNames = [UIFont familyNames];
		for (NSString *familyName in fontFamilyNames) {
			NSArray *names = [UIFont fontNamesForFamilyName:familyName];
			CCLOG(@"%@ = %@",familyName,names);
		}
		
	}
	return self;
}


@end
