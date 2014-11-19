//
//  ParticleManager.m
//  AngryBirds
//
//
//

#import "ParticleManager.h"

static ParticleManager *instance;
@implementation ParticleManager
+ (id) sharedParticleManager {
	if (instance == nil) {
		instance = [[ParticleManager alloc] init];
	}
	return instance;
}
- (CCParticleSystem *) particleWithType:(ParticleTypes)type {
	CCParticleSystem *system = nil;
	switch (type) {
		case bloodSpurts:
			// 使用bloodSpurts.plist作为粒子效果的文件
			system = [CCParticleSystemQuad particleWithFile:@"bloodSpurts.plist"];
			// 设置粒子效果位置独立
			[system setPositionType:kCCPositionTypeFree];
			// 粒子效果完成后自动删除
			[system setAutoRemoveOnFinish:YES];
			break;
		case magic:
			// 使用magic.plist作为粒子效果的文件
			system = [CCParticleSystemQuad particleWithFile:@"magic.plist"];
			[system setBlendAdditive:false];
			// 设置粒子效果位置独立
			[system setPositionType:kCCPositionTypeFree];
			// 粒子效果完成后自动删除
			[system setAutoRemoveOnFinish:YES];
			break;
		default:
			break;
	}
	return system;
}
@end
