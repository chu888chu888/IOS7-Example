//
//  Ice.mm
//  AngryBirds
//

#import "Ice.h"

@implementation Ice
-(id)initWithX:(float)x andY:(float)y andWorld:(b2World *)world {
	_world = world;
	 // 设置Ice的基本属性
	_imageName = @"ice";
	self = [super initWithFile:[NSString stringWithFormat:@"%@1.png", _imageName]];
	self.position = ccp(x, y);
	self.tag = ICE_TAG;
	_HP = 10;
	self.scale = 2.0f/10;
	// 创建物体定义
	b2BodyDef bodyDef;
	bodyDef.type = b2_dynamicBody;
	bodyDef.position.Set(x/PTM_RATIO, y/PTM_RATIO);
	bodyDef.userData = (__bridge void*)self;
	b2Body *body = world->CreateBody(&bodyDef);
	// 多边形
	b2PolygonShape blockShape;
	blockShape.SetAsBox(self.contentSize.width/11/PTM_RATIO
		,self.contentSize.height/11/PTM_RATIO);
	// 创建Fixture定义
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &blockShape;
	fixtureDef.density = 10.0f;
	fixtureDef.friction = 1.0f;
	fixtureDef.restitution = 0;
	body->CreateFixture(&fixtureDef);
	return self;
}

@end
