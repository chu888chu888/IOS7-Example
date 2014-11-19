//
//  MyContactListener.h
//  AngryBirds
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"
#import "BaseSprite.h"
#import "Bird.h"

class MyContactListener : public b2ContactListener{

public:
	b2World *_world;
	CCLayer *_layer;
	MyContactListener();
	MyContactListener(b2World *world,CCLayer *layer);
	~MyContactListener();
	
	virtual void BeginContact(b2Contact* contact) ;
	
	virtual void EndContact(b2Contact* contact) ;
	
	virtual void PreSolve(b2Contact* contact, const b2Manifold* oldManifold);
	
	virtual void PostSolve(b2Contact* contact, const b2ContactImpulse* impulse);
};


