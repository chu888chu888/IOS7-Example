//
//  Pig.mm
//  AngryBirds
//
//
#import "Pig.h"

@implementation Pig
-(id)initWithX:(float)x andY:(float)y andWorld:(b2World*)world {
	_world = world;
	// 设置pig的基本属性
	_imageName = @"pig";
	self = [super initWithFile:[NSString stringWithFormat:@"%@1.png", _imageName]];
	self.position = ccp(x, y);
	self.tag = PIG_TAG;
	_HP = 1;
	self.scale = 2.0f/10;
	// 创建物体定义
	b2BodyDef bodyDef;
	bodyDef.type = b2_dynamicBody;
	bodyDef.position.Set(x/PTM_RATIO, y/PTM_RATIO);
	bodyDef.userData = (__bridge void*)self;
	b2Body *body = world->CreateBody(&bodyDef);
	float size = 0.12f;
	// 多边形
	b2PolygonShape blockShape;
	b2Vec2 vertices[] = {
		b2Vec2(size ,-2*size),
		b2Vec2(2*size,-size),
		b2Vec2(2*size,size),
		b2Vec2(size,2*size),
		b2Vec2(-size,2*size),
		b2Vec2(-2*size,size),
		b2Vec2(-2*size,-size),
		b2Vec2(-size,-2*size)
	};
	blockShape.Set(vertices, 8);
	// 创建Fixture定义
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &blockShape;
	fixtureDef.density = 80.0f;
	fixtureDef.friction = 80.0f;
	fixtureDef.restitution = 0.15f;
	body->CreateFixture(&fixtureDef);
	return self;
}
@end
