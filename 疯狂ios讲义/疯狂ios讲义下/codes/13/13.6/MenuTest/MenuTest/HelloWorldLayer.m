//
//  HelloWorldLayer.m
//  MenuTest
//
//  Created by Jason on 13-10-12.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "Layer2.h"

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
	// 将HelloWorldLayer层添加为scene场景的子节点
	[scene addChild: layer];
	// 返回scene场景对象
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	if( (self=[super init]) ) {
        // 通过CCDirector导演对象获得屏幕大小
        CGSize size = [[CCDirector sharedDirector] winSize];
        // 创建一个CCMenuItemImage对象，正常情况显示btn-play-normal.png图片
        // 选中时显示btn-play-selected.png图片，选中菜单时执行block块中的代码
        CCMenuItemImage *menuItem1 = [CCMenuItemImage itemWithNormalImage:@"btn-play-normal.png" selectedImage:@"btn-play-selected.png"
                block:^(id sender){
                    // 创建一个场景对象
                    CCScene *scene = [CCScene node];
                    // 创建一个Layer2层对象作为场景对象的子节点
                    [scene addChild:[Layer2 node]];
                    // 导演对象刷新场景显示Layer（即HelloWorld）
                    [[CCDirector sharedDirector] replaceScene:scene];
                    
                }];
        // 设置CCMenuItemImage对象在屏幕居中位置
        menuItem1.position =ccp( size.width /2 , size.height/2+50 );
        // 设置Quit菜单项字体和字体大小
        [CCMenuItemFont setFontSize:30];
	[CCMenuItemFont setFontName: @"Courier New"];
        // 选中Quit菜单项时结束
	CCMenuItemFont *menuItem2 = [CCMenuItemFont itemWithString: @"Quit" block:^(id sender){
			CC_DIRECTOR_END();
		}];
        menuItem2.position =ccp( size.width /2 , size.height/2-50 );
        // 将CCMenuItemImage作为CCMenu的子节点
        CCMenu *ccMenu = [CCMenu menuWithItems:menuItem1,menuItem2,nil];
        // CCMenu的位置为0，0
        ccMenu.position = CGPointZero;
        // 将CCMenu菜单对象添加为该层的子节点
        [self addChild:ccMenu];
	}
	return self;
}

@end

#pragma mark - Layer2
@implementation Layer2
-(id) init
{
	if( (self=[super init]) ) {
		// 通过CCDirector导演对象获得屏幕大小
		CGSize size = [[CCDirector sharedDirector] winSize];
		// 初始化HelloWorld标签对象
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];
		// 设置标签对象在屏幕居中位置
		label.position =  ccp( size.width /2 , size.height/2 );
		// 将标签对象添加为该层的子节点
		[self addChild: label];
    }
    return self;
}
@end
