//
//  Bird.mm
//  AngryBirds
//
//

#import "Bird.h"
@implementation Bird

@synthesize isFly = _isFly, isReady = _isReady;

// 覆盖父类的初始化方法
-(id)initWithX:(float)x andY:(float)y andWorld:(b2World *)world
{
	_world = world;
	// 创建精灵
	_imageName = @"bird";
	self = [super initWithFile:[NSString stringWithFormat:@"%@1.png", _imageName]];
	// 设置tag
	self.tag = BIRD_TAG;
	// 设置坐标
	self.position = ccp(x, y);
	// 设置生命值
	_HP = 1;
	self.scale = 0.3f;
	return self;
}

-(void)setBodyWithX:(float)x andY:(float)y andWorld:(b2World*)world{
	// 创建一个b2BodyDef
	b2BodyDef bodyDef;
	// 设置物体的type为动态物体
	bodyDef.type = b2_dynamicBody;
	// 设置物体的坐标位置，注意要转换成物理世界的坐标
	bodyDef.position.Set(self.position.x/PTM_RATIO, self.position.y/PTM_RATIO);
	// 将Objective-C ARC 的对象类型用 __bridge 转换为 void* 类型
	bodyDef.userData = (__bridge void*)self;
	// 调用世界的工厂方法创建刚体b2Body
	b2Body *b2Body = world->CreateBody(&bodyDef);
	//  定义一个圆形
	b2CircleShape shape;
	// 设置半径
	shape.m_radius = 5.0f/PTM_RATIO;
	// 定义b2FixtureDef
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &shape;
	fixtureDef.density = 80.0f;
	fixtureDef.friction = 1.0f;
	fixtureDef.restitution = 0.5f;
	// 使用b2Body的工厂方法根据b2FixtureDef创建Fixture
	b2Body->CreateFixture(&fixtureDef);
	// 定义重力矢量（x,y）
	b2Vec2 force = b2Vec2(x, y);
	// 给中心点一个力,物体就会按照设计飞行
	b2Body->ApplyLinearImpulse(force, bodyDef.position);
}

-(void)hitAnimationWithX:(float)x andY:(float)y andLayer:(CCLayer*) layer{
	for (int i = 0; i<6; i++) {
		int range = 2;
		// 羽毛
		CCSprite *plume = [CCSprite spriteWithFile:@"plume1.png"];
		plume.scale = (float)(arc4random()%5/10.1f);
		
		plume.position = CGPointMake(x+arc4random()%10*range-10, y+arc4random()%10*range-10);
		id moveTo = [CCMoveTo actionWithDuration:1 position:CGPointMake(x+arc4random()%10*range-10, y+arc4random()%10*range-10)];
		
		id fadeOut = [CCFadeOut actionWithDuration:1];
		id rotateBy = [CCRotateBy actionWithDuration:1 angle:arc4random()%180];
		
		id spawn =[CCSpawn actions:moveTo,fadeOut,rotateBy,nil];
		[plume runAction:spawn];
		
		[layer addChild:plume];
	}
}


@end
