//
//  ParticleManager.h
//  AngryBirds
//
//  Created by Jason on 13-9-29.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

// 使用枚举来定义多种粒子效果，这样设计有利于程序扩展
typedef enum {
	snow,  // 雪花的粒子效果
	explosition  // 小鸟爆破的粒子效果
} ParticleTypes;

@interface ParticleManager : NSObject

// 单例方法
+ (id) sharedParticleManager;
// 获取指定type的粒子对象
- (CCParticleSystem *) particleWithType:(ParticleTypes)type;

@end
