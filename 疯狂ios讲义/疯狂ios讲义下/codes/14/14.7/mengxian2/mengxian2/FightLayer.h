//
//  FightLayer.h
//  mengxian
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SpriteBase.h"
#import "ParticleManager.h"

@interface FightLayer : CCLayer {
	SpriteBase *_player;  // 玩家
	SpriteBase *_monster;  // 怪物
}
@property SpriteBase *player;
@property SpriteBase * monster;
+(CCScene *) scene;
@end
