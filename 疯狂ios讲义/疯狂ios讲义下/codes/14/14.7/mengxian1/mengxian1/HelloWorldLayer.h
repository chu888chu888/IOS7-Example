//
//  HelloWorldLayer.h
//  mengxian
//
//  Created by Jason on 13-10-22.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "SpriteBase.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer 
{
	CCTMXTiledMap* _tileMap;  // 地图
	SpriteBase *_player;  // 玩家精灵
	CCArray *_monsterArray;  // 怪物数组
}
@property SpriteBase *player;
@property CCTMXTiledMap* tileMap;
@property CCArray *monsterArray;
+(CCScene *) scene;
@end