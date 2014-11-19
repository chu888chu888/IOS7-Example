//
//  ParticleManager.m
//  AngryBirds
//
//

#import "ParticleManager.h"

// 静态变量，单例对象
static ParticleManager *particleManager;

@implementation ParticleManager

// 单例方法
+ (id) sharedParticleManager {
	if (particleManager == nil) {
		particleManager = [[ParticleManager alloc] init];
	}
	return particleManager;
}

// 获取指定type的粒子对象，参数是h文件中定义的枚举
- (CCParticleSystem *) particleWithType:(ParticleTypes)type {
	// CCParticleSystem，所有粒子对象的最上层父类
	CCParticleSystem *particleSystem = nil;
	switch (type) {
		case snow:
		{
			// 获取得雪花的粒子对象
			particleSystem = [CCParticleSnow node];
			// 把snow.png图片转化为纹理
			CCTexture2D *texture2D = [[CCTextureCache sharedTextureCache] 
				addImage:@"snow.png"];
			// 粒子对象设置纹理
			[particleSystem setTexture:texture2D];
			break;
		}
		case explosition:
		{
			// 使用bird-explosition作为粒子效果的文件
			particleSystem = [CCParticleSystemQuad particleWithFile:@"bird-explosition.plist"];
			// 设置粒子效果位置独立
			[particleSystem setPositionType:kCCPositionTypeFree];
			// 粒子效果完成后自动删除
			[particleSystem setAutoRemoveOnFinish:YES];
			break;
		}
		default:
			break;
	}
	return particleSystem;
}
@end
