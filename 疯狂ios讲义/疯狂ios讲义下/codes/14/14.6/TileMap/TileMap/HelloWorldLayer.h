//
//  HelloWorldLayer.h
//  TileMap
//
//  Created by Jason on 13-9-27.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer 
{
    CCTMXTiledMap* _tileMap;  // 地图
    CCSprite* _player;  // 玩家
}

+(CCScene *) scene;

@property (nonatomic,retain) CCTMXTiledMap* tileMap;
@property (nonatomic,retain) CCSprite* player;

@end
