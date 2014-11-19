//
//  MyParticle.m
//  ParticleEffectTest
//
//  Created by Jason on 13-9-23.
//
//

#import "MyParticle.h"

@implementation MyParticle

-(id)init{
	// 设置粒子数量是200 如果数量过多，粒子会叠加在一起，影响效果，建议不超过2000
	return [self initWithTotalParticles:200];
}
//重写父类方法，初始化一个粒子系统与固定数量的粒子
-(id)initWithTotalParticles:(NSUInteger)numberOfParticles{
	if((self =[super initWithTotalParticles:numberOfParticles])){
		// 粒子发射器的持续时间，kCCParticleDurationInfinity表示粒子效果永远持续下去
		self.duration =kCCParticleDurationInfinity;
		// 发射器模式：重力模式（kCCParticleModeGravity）、半径模式（kCCParticleModeRadius）
		self.emitterMode =kCCParticleModeGravity;
//		self.emitterMode =kCCParticleModeRadius;
		if(self.emitterMode == kCCParticleModeGravity){
			self.sourcePosition=ccp(-10, 0);
			// gravity：粒子在x轴和y轴的加速度
			self.gravity = ccp(0,-90);
			// radialAccel：粒子的径向加速度
			self.radialAccel = 0;
			// 粒子间的径向加速度差异
			self.radialAccelVar = 0;
			// tangentialAccel：粒子的切向加速度
			self.tangentialAccel = 100;
			// 粒子间的切线加速度差异
			self.tangentialAccelVar =10;
			// speed：粒子的运动速度
			self.speed = 150;
			// 粒子的速度差异
			self.speedVar = 50;
		} else if(self.emitterMode == kCCParticleModeRadius){
			// startRadius：所发射粒子和粒子效果节点位置开的距离
			self.startRadius = 120;
			// 粒子间开始半径差异
			self.startRadiusVar = 0;
			// endRadius：粒子要旋转到的位置和节点位置间的距离
			self.endRadius = 10;
			// 粒子间结束半径差异
			self.endRadiusVar = 0;
			// rotatePerSecond：影响粒子移动的方向，速度以及当startRadius和endRadius不同时的旋转时间
			self.rotatePerSecond = -150;
			// 粒子间每秒的旋转角度差异
			self.rotatePerSecondVar = 0;
		}
		// 设置粒子发射器的位置和位置类型
		CGSize winSize = [CCDirector sharedDirector].winSize;
		self.position = ccp(winSize.width/2,winSize.height/2);
		self.posVar = CGPointZero;
		self.positionType = kCCPositionTypeFree;
		// 粒子发射的方向
		self.angle = 80;
		self.angleVar =20;
		// 粒子的生命周期
		self.life = 2.0f;
		self.lifeVar =1.0f;
		// 每一帧所发射的粒子数量
		self.emissionRate = self.totalParticles/self.life;
		// 粒子的颜色
		_startColor.r = 1.0f;
		_startColor.g = 1.0f;
		_startColor.b = 1.0f;
		_startColor.a = 1.0f;
		_startColorVar.r = 0.5f;
		_startColorVar.g = 0.5f;
		_startColorVar.b = 0.5f;
		_startColorVar.a = 0.5f;
		_endColor.r = 0.2f;
		_endColor.g = 0.2f;
		_endColor.b = 0.2f;
		_endColor.a = 0.2f;
		_endColorVar.r = 0.1f;
		_endColorVar.g = 0.1f;
		_endColorVar.b = 0.1f;
		_endColorVar.a = 0.1f;
		// 设置粒子大小,单位是像素
		self.startSize = 6.0f;
		self.startSizeVar = 2.0f;
		// kCCParticleStartSizeEqualToEndSize使粒子大小在其生命周期中不发生变化
		self.endSize = kCCParticleStartSizeEqualToEndSize;
		self.endSizeVar =0;
		// 粒子的纹理fire.png是cocos2d自带的图片，在Resourcs目录下的Images目录下
		self.texture = [[CCTextureCache sharedTextureCache] addImage: @"fire.png"];
		// 粒子的混合模式
		self.blendFunc = (ccBlendFunc){GL_SRC_ALPHA,GL_DST_ALPHA};
		self.blendAdditive = NO;
	}
	return self;
}
@end
