//
//  LevelScene.h
//  AngryBirds
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface LevelLayer : CCLayer {
	int _successLevel;  //当前成功关卡数
}
+(CCScene *) scene;
@end
