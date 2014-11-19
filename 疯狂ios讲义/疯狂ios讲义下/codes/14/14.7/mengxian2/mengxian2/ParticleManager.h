//
//  ParticleManager.h
//  AngryBirds
//
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

// 定义2种粒子效果
typedef enum {
    bloodSpurts, // 血花四溅的粒子效果
    magic // 魔法光波的粒子效果
} ParticleTypes;
@interface ParticleManager : NSObject
// 获得单例对象
+ (id) sharedParticleManager;
// 获得指定type的粒子对象
- (CCParticleSystem *) particleWithType:(ParticleTypes)type;
@end
