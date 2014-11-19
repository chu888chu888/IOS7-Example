//
//  GameScene.h
//  AngryBirds
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "JsonParser.h"
#import "BaseSprite.h"
#import "Pig.h"
#import "Bird.h"
#import "Ice.h"
#import "SlingShot.h"
#import "MyContactListener.h"


@interface GameLayer : CCLayer {
	int _currentLevel;  // 当前关卡
	CCArray *_birds;  // 小鸟数组
	Bird *_currentBird;  // 当前小鸟
	BOOL _isStart;  // 游戏开始
	BOOL _isFinish;  // 游戏结束
	int _touchStatus;  // 状态变量,是否触摸小鸟
	b2World* _world;  // 定义一个世界b2World
	
	SlingShot *_slingShot;  // 弹弓
	
	// 碰撞事件监听对象
	MyContactListener *_contactListener;
}

// 类方法，初始化场景
+(id) sceneWithLevel:(int) level;

@end
