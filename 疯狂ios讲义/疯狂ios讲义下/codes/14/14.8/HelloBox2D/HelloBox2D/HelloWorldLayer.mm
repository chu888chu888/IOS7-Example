//
//  HelloWorldLayer.mm
//  HelloBox2D
//
//  Created by Jason on 13-10-10.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//

// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#import "PhysicsSprite.h"

enum {
	kTagParentNode = 1,
};


#pragma mark - HelloWorldLayer

@interface HelloWorldLayer()
-(void) initPhysics;
-(void) addNewSpriteAtPosition:(CGPoint)p;
-(void) createMenu;
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
		
		// 启用对触摸事件和重力感应事件的支持
		self.isTouchEnabled = YES;
		self.isAccelerometerEnabled = YES;
		CGSize s = [CCDirector sharedDirector].winSize;
		
		// 初始化Box2D世界
		[self initPhysics];
		
		// create reset button
		[self createMenu];
		
		//Set up sprite
		
#if 1
		// Use batch node. Faster
		CCSpriteBatchNode *parent = [CCSpriteBatchNode
			batchNodeWithFile:@"blocks.png" capacity:100];
		spriteTexture_ = [parent texture];
#else
		// doesn't use batch node. Slower
		spriteTexture_ = [[CCTextureCache sharedTextureCache] addImage:@"blocks.png"];
		CCNode *parent = [CCNode node];
#endif
		[self addChild:parent z:0 tag:kTagParentNode];
		
		[self addNewSpriteAtPosition:ccp(s.width/2, s.height/2)];
		
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Tap screen"
			fontName:@"Marker Felt" fontSize:32];
		[self addChild:label z:0];
		[label setColor:ccc3(0,0,255)];
		label.position = ccp( s.width/2, s.height-50);
		
		[self scheduleUpdate];
	}
	return self;
}

-(void) dealloc
{
	delete world;
	world = NULL;
	
	delete m_debugDraw;
	m_debugDraw = NULL;
	
}	

-(void) createMenu
{
	// Default font size will be 22 points.
	[CCMenuItemFont setFontSize:22];
	
	// Reset Button
	CCMenuItemLabel *reset = [CCMenuItemFont itemWithString:@"Reset" block:^(id sender){
		[[CCDirector sharedDirector] replaceScene: [HelloWorldLayer scene]];
	}];
	
	// Achievement Menu Item using blocks
	CCMenuItem *itemAchievement = [CCMenuItemFont itemWithString:
		@"Achievements" block:^(id sender) {
		
		GKAchievementViewController *achivementViewController =
			[[GKAchievementViewController alloc] init];
		achivementViewController.achievementDelegate = self;
		
		AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
		
		[[app navController] presentModalViewController:achivementViewController animated:YES];
		
	}];
	
	// Leaderboard Menu Item using blocks
	CCMenuItem *itemLeaderboard = [CCMenuItemFont itemWithString:
		@"Leaderboard" block:^(id sender) {
		
		GKLeaderboardViewController *leaderboardViewController = 
			[[GKLeaderboardViewController alloc] init];
		leaderboardViewController.leaderboardDelegate = self;
		
		AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
		
		[[app navController] presentModalViewController:leaderboardViewController animated:YES];
		
	}];
	
	CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, reset, nil];
	
	[menu alignItemsVertically];
	
	CGSize size = [[CCDirector sharedDirector] winSize];
	[menu setPosition:ccp( size.width/2, size.height/2)];
	
	
	[self addChild: menu z:-1];	
}

// 初始化Box2D世界，HelloBox2D中最重要的方法之一
-(void) initPhysics
{
	CGSize s = [[CCDirector sharedDirector] winSize];
	// ①定义一个重力向量，b2Vec2类是Box2D中用了表示向量的类
	b2Vec2 gravity;
	// ②设置重力参数，水平为0，垂直大小是-10
	gravity.Set(0.0f, -10.0f);
	// ③使用该重力参数创建一个新的Box2D物理世界
	world = new b2World(gravity);
	// ④设置世界的SetAllowSleeping属性，当物体在处于静止状态时会进入“休眠”状态，
	// 当其他物体撞上它，该物体才会“苏醒”，用于提升Box2D计算效率
	world->SetAllowSleeping(true);
	// ⑤设置世界是否支持连续碰撞机制
	world->SetContinuousPhysics(true);
	// 设置GLESDebugDraw的相关内容，GLESDebugDraw通常仅在测试阶段使用
	m_debugDraw = new GLESDebugDraw( PTM_RATIO );
	world->SetDebugDraw(m_debugDraw);
	uint32 flags = 0;
	flags += b2Draw::e_shapeBit;
	flags += b2Draw::e_jointBit;
	flags += b2Draw::e_aabbBit;
	flags += b2Draw::e_pairBit;
	flags += b2Draw::e_centerOfMassBit;
	m_debugDraw->SetFlags(flags);
	// ⑥创建物体定义，并使用物体定义来指定物体的初始属性，比如位置、速度等
	b2BodyDef groundBodyDef;
	// ⑦(0, 0)指初始位置为左下角
	groundBodyDef.position.Set(0, 0);
	// ⑧使用世界对象的物体工厂来创建物体
	b2Body* groundBody = world->CreateBody(&groundBodyDef);
	// ⑨为物体定义一个形状（shape），代表要模拟的物体（地面）的几何形状
	// 这里定义了一个简单的四边形。设置了四边形的4个边界，并使用物体的夹具工厂分别创建边界所对应的夹具（Fixture）
	b2EdgeShape groundBox;
	//⑩上
	groundBox.Set(b2Vec2(0,0), b2Vec2(s.width/PTM_RATIO,0));
	groundBody->CreateFixture(&groundBox,0);
	// 下
	groundBox.Set(b2Vec2(0,s.height/PTM_RATIO),
		b2Vec2(s.width/PTM_RATIO,s.height/PTM_RATIO));
	groundBody->CreateFixture(&groundBox,0);
	// 左
	groundBox.Set(b2Vec2(0,s.height/PTM_RATIO), b2Vec2(0,0));
	groundBody->CreateFixture(&groundBox,0);
	// 右
	groundBox.Set(b2Vec2(s.width/PTM_RATIO,s.height/PTM_RATIO), 
		b2Vec2(s.width/PTM_RATIO,0));
	groundBody->CreateFixture(&groundBox,0);
}

-(void) draw
{
	//
	// IMPORTANT:
	// This is only for debug purposes
	// It is recommend to disable it
	//
	[super draw];
	glLineWidth(6.0f); // 设置线宽
	ccGLEnableVertexAttribs( kCCVertexAttribFlag_Position );
	
	kmGLPushMatrix();
	
	world->DrawDebugData();	
	
	kmGLPopMatrix();
}

// addNewSpriteAtPosition方法用于在指定位置创建精灵对象和物体
-(void) addNewSpriteAtPosition:(CGPoint)p
{
	CCLOG(@"Add sprite %0.2f x %02.f",p.x,p.y);
	// ①获取之前创建的节点对象
	CCNode *parent = [self getChildByTag:kTagParentNode];
	// ②随机从blocks.png的四种图片中挑选一种创建精灵对象，
	// 添加为当前层的子节点，并设置位置
	int idx = (CCRANDOM_0_1() > .5 ? 0:1);
	int idy = (CCRANDOM_0_1() > .5 ? 0:1);
	PhysicsSprite *sprite = [PhysicsSprite spriteWithTexture:spriteTexture_
		rect:CGRectMake(32 * idx,32 * idy,32,32)];
	[parent addChild:sprite];
	sprite.position = ccp( p.x, p.y);
	// ③创建一个物体定义，并使用物体定义来指定物体的初始属性，比如位置、速度等
	b2BodyDef bodyDef;
	bodyDef.type = b2_dynamicBody;
	bodyDef.position.Set(p.x/PTM_RATIO, p.y/PTM_RATIO);
	// ④使用世界对象的物体工厂来创建物体
	b2Body *body = world->CreateBody(&bodyDef);
	// ⑤为物体定义一个形状（shape），代表要模拟的物体的几何形状
	b2PolygonShape dynamicBox;
	dynamicBox.SetAsBox(.5f, .5f);
	// ⑥创建夹具定义，将夹具形状定义为刚刚所定义的形状，
	// 同时设置属性，比如密度、表面摩擦力等
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &dynamicBox;
	fixtureDef.density = 1.0f;
	fixtureDef.friction = 0.3f;
	// ⑦使用物体的夹具工厂创建夹具
	body->CreateFixture(&fixtureDef);
	// ⑧设置精灵对象所对应的物体
	[sprite setPhysicsBody:body];
	// 还可以使用以下代码设置精灵对象所对应的物体
	//	bodyDef.userData = sprite;
}

-(void) update:(ccTime) dt
{
	//It is recommended that a fixed time step is used with Box2D for stability
	//of the simulation, however, we are using a variable time step here.
	//You need to make an informed choice, the following URL is useful
	//http://gafferongames.com/game-physics/fix-your-timestep/
	
	int32 velocityIterations = 8;
	int32 positionIterations = 1;
	// 调用world对象的Step方法,这样Box2D世界就可以进行物理仿真了。
	// 这里的数字越小,精度越小,但是效率更高。数字越大,仿真越精确,但同时耗时更多。
	world->Step(dt, velocityIterations, positionIterations);	
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	//Add a new body/atlas sprite at the touched location
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		
		location = [[CCDirector sharedDirector] convertToGL: location];
		
		[self addNewSpriteAtPosition: location];
	}
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

@end
