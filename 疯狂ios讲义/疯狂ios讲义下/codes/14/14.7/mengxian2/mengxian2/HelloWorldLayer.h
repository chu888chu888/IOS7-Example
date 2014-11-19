//
//  HelloWorldLayer.h
//  mengxian
//
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "SpriteBase.h"
#import "FightLayer.h"
#import "Grid.h"
#import "PathArithmetic.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer 
{
	CCTMXTiledMap* _tileMap; // 地图
	SpriteBase *_player; // 玩家精灵
	CCArray *_monsterArray; // 怪物数组
	NSMutableArray *_gridArray; // 代表地图的二维数组
	BOOL _isMove;
}
@property SpriteBase *player;
@property CCTMXTiledMap* tileMap;
@property CCArray *monsterArray;
@property NSMutableArray *gridArray;
@property BOOL isMove;

+(CCScene *) scene;
@end
