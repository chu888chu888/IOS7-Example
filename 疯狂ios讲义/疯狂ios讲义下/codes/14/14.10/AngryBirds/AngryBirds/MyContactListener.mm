//
//  MyContactListener.m
//  AngryBirds
//
//

#import "MyContactListener.h"

MyContactListener :: MyContactListener(){

}

MyContactListener :: MyContactListener(b2World *world,CCLayer *layer){
	_world = world;
	_layer = layer;
}

MyContactListener :: ~MyContactListener(){
	
}

void MyContactListener :: BeginContact(b2Contact* contact){
	
}

void MyContactListener :: EndContact(b2Contact* contact){
	
}

void MyContactListener :: PreSolve(b2Contact* contact, const b2Manifold* oldManifold){
	
}
// solve计算完成后调用的函数
void MyContactListener :: PostSolve(b2Contact* contact, const b2ContactImpulse* impulse){
	// 获得冲量
	float force = impulse->normalImpulses[0];
	// 当冲量大于2时
	if(force > 2){
		BaseSprite *spriteA = 
			(__bridge BaseSprite *)contact->GetFixtureA()->GetBody()->GetUserData();
		BaseSprite *spriteB =
			(__bridge BaseSprite *)contact->GetFixtureB()->GetBody()->GetUserData();
		if(spriteA && spriteB){
			[spriteA setHP:spriteA.HP - force];
			[spriteB setHP:spriteB.HP - force];
			if(spriteA.tag == BIRD_TAG){
				Bird *bird = (Bird *)spriteA;
				// 播放动画
				[bird hitAnimationWithX:bird.position.x
					andY:bird.position.y andLayer:_layer];
			}
			if(spriteB.tag == BIRD_TAG){
				Bird *bird = (Bird *)spriteB;
				[bird hitAnimationWithX:bird.position.x
					andY:bird.position.y andLayer:_layer];
			}
		}
	}
}







