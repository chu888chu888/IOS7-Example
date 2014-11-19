//
//  HelloWorldLayer.mm
//  BallBox2D
//
//  Created by Jason on 13-10-11.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//

// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"


#pragma mark - HelloWorldLayer

@interface HelloWorldLayer()
-(void) initPhysics;
-(void) initImageArray;
-(void) addNewSpriteAtPosition:(CGPoint)p;
@end

@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
		
		// enable events
		
		self.isAccelerometerEnabled = YES;
		// 激活触摸事件
		[[[CCDirector sharedDirector] touchDispatcher]
			addTargetedDelegate:self priority:0 swallowsTouches:YES];
		// 初始化物理世界
		[self initPhysics];
		// 初始化图像数组
		[self initImageArray];
		[self scheduleUpdate];
	}
	return self;
}

-(void) dealloc
{
	delete _world;
	_world = NULL;
	
}	

-(void) initPhysics
{
	
	CGSize winSize = [[CCDirector sharedDirector] winSize];
	
	b2Vec2 gravity;
	gravity.Set(0.0f, -30.0f);
	// 创建Box2D物理世界
	_world = new b2World(gravity);
	
	// 设置世界的SetAllowSleeping属性，当物体在处于静止状态时会进入“休眠”状态
	_world->SetAllowSleeping(true);
	// 设置世界是否支持连续碰撞机制
	_world->SetContinuousPhysics(true);
	
	// 首先创建一个物体定义,用以指定物体的初始属性,比如位置或者速度。
	b2BodyDef groundBodyDef;
	// 左下方角落
	groundBodyDef.position.Set(0, 0);
	
	// 一旦创建好物体定义后,就可以调用_world对象来创建一个物体对象了。
	b2Body* groundBody = _world->CreateBody(&groundBodyDef);
	
	// 然后,为物体对象定义一个边缘图形（b2EdgeShape）,用以指定想要仿真的物体的几何形状。
	b2EdgeShape groundBox;		
	
	// 设置边界
	// 底部边界
	groundBox.Set(b2Vec2(0,0), b2Vec2(winSize.width/PTM_RATIO,0));
	groundBody->CreateFixture(&groundBox,0);
	
	// 顶部边界
	groundBox.Set(b2Vec2(0,winSize.height/PTM_RATIO), 
		b2Vec2(winSize.width/PTM_RATIO,winSize.height/PTM_RATIO));
	groundBody->CreateFixture(&groundBox,0);
	
	// 左边边界
	groundBox.Set(b2Vec2(0,winSize.height/PTM_RATIO), b2Vec2(0,0));
	groundBody->CreateFixture(&groundBox,0);
	
	// 右边边界
	groundBox.Set(b2Vec2(winSize.width/PTM_RATIO, winSize.height/PTM_RATIO),
		b2Vec2(winSize.width/PTM_RATIO,0));
	groundBody->CreateFixture(&groundBox,0);
}

-(void) initImageArray{
	_imageArray = [CCArray arrayWithCapacity:2];
	[_imageArray addObject:@"basketball.png"];
	[_imageArray addObject:@"football.png"];
}


-(void) addNewSpriteAtPosition:(CGPoint)p
{
	int rand = arc4random() % 2;
	// 随机获取一张图片资源
	NSString *image = [_imageArray objectAtIndex:rand];
	// 经常被用到或者需要频繁加载的一些资源，如果每次都从文件中加载，
	// 程序的效率会变得非常低，通常的做法是将这些文件先读到缓存中，然后再从缓存中加载。
	// 如果一个资源已经被加入到了缓存，addImage是不会	再加一遍的。
	CCTexture2D *spriteTexture = [[CCTextureCache sharedTextureCache] addImage:image];
	CCSprite *ballSprite = [CCSprite spriteWithTexture:spriteTexture];
	ballSprite.position = ccp(p.x, p.y);
	[self addChild:ballSprite];
	
	// 创建物体定义
	b2BodyDef bodyDef;
	// 我们指定body的类型为dynamicBody。默认值是staticBody，
	// staticBody意味着那个body不能被移动也不会参与仿真。
	bodyDef.type = b2_dynamicBody;
	// 坐标单位到物体单位的转换
	bodyDef.position.Set(p.x/PTM_RATIO, p.y/PTM_RATIO);
	// 设置body的userData属性为精灵对象。这里可以设置任何对象，
	// 但是设置成精灵会很方便，特别是当两个body碰撞的时候，
	// 可以通过这个参数把精灵对象取出来，然后做一些逻辑处理。
	bodyDef.userData = (__bridge void*)ballSprite;
	// 创建物体
	b2Body *body = _world->CreateBody(&bodyDef);
	
	// 定义圆形图形（b2CircleShape）
	b2CircleShape circleShape;
	// 设置半径
//	circleShape.m_radius = 26.0/PTM_RATIO;
circleShape.m_radius = ballSprite.contentSize.width/2/PTM_RATIO;	
	// 创建夹具（b2FixtureDef）定义
	b2FixtureDef fixtureDef;
	// 设置图形为上面定义的圆形
	fixtureDef.shape = &circleShape;
	// 设置单位体积的质量即密度（Density）。一个对象的密度越大，
	// 那么它就有更多的质量，就会越难以移动。
	fixtureDef.density = 1.0f;
	// 设置摩擦力（Friction）。它的范围是0～1.0。
	// 0意味着没有摩擦，1代表最大摩擦、几乎移不动的摩擦。
	fixtureDef.friction = 0.3f;
	// 设置回复力即弹力（Restitution）。它的范围也是0～1.0。
	// 0意味着对象碰撞之后不会反弹，1意味着完全弹性碰撞，即以同样的速度反弹。
	fixtureDef.restitution = 0.8f;
	
	// 创建夹具（b2Fixture）
	body->CreateFixture(&fixtureDef);
}

-(void) update: (ccTime) dt
{
	//It is recommended that a fixed time step is used with Box2D for stability
	//of the simulation, however, we are using a variable time step here.
	//You need to make an informed choice, the following URL is useful
	//http://gafferongames.com/game-physics/fix-your-timestep/
	
	int32 velocityIterations = 8;
	int32 positionIterations = 1;
	
	// Instruct the world to perform a single step of simulation. It is
	// generally best to keep the time step and iterations fixed.
	// 调用world对象的Step方法，这样Box2D世界就可以进行物理仿真了。
	// 这里的数字越小,精度越小，但是效率更高。数字越大,仿真越精确，但同时耗时更多。
	_world->Step(dt, velocityIterations, positionIterations);
	
	// 遍历 world 对象里面的所有 body
	for (b2Body *b = _world->GetBodyList(); b ; b = b->GetNext()) {
		if(b->GetUserData() != NULL){
			//  body的userData属性是否为空，如果不为空，就可以强制转换成精灵对象
			CCSprite *ballSprite = (__bridge CCSprite*)b->GetUserData();
			// 根据 body 的位置来更新精灵的位置
			ballSprite.position = ccp(b->GetPosition().x*PTM_RATIO, b->GetPosition().y*PTM_RATIO);
			// 设置精灵旋转角度
			ballSprite.rotation = -1 * CC_RADIANS_TO_DEGREES(b->GetAngle());
		}
	}
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
	return YES;
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
	// 获得触摸点
	CGPoint location = [touch locationInView: [touch view]];
	// 转换坐标
	location = [[CCDirector sharedDirector] convertToGL: location];
	// 创建篮球
	[self addNewSpriteAtPosition: location];
}

/**
 添加重力感应事件的支持: 将加速器记向量乘以某个数，并设置为物理仿真中的重力向量
 */
-(void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleratio{
	// 设置加速计的向量乘以某个数
	b2Vec2 gravity(-acceleratio.y * 15, acceleratio.x *15);
	// 设置为 world 对象的重力向量
	_world->SetGravity(gravity);
}


@end
