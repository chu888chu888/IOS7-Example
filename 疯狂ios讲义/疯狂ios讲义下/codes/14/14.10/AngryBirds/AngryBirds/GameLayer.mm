// 
//   GameScene.m
//   AngryBirds
// 
// 

#import "GameLayer.h"
#import "LevelLayer.h"
#import "LevelUtils.h"

#define SLINGSHOT_POS ccp(85, 125)

@interface GameLayer()

// 根据关卡数初始化场景
-(id) initWithLevel:(int) level;
// 创建物理世界
-(void) createBox2DWorld;
// 创建关卡
-(void) createLevel;
// 小鸟跳上弹弓
- (void) jump;

@end

@implementation GameLayer

// 类方法，初始化场景
+(id) sceneWithLevel:(int) level{
	CCScene *scene = [CCScene node];
	GameLayer *layer = [[[self class] alloc] initWithLevel:level];
	[scene addChild:layer];
	return  scene;
}

// 根据关卡数初始化场景
-(id) initWithLevel:(int) level{
	if( (self=[super init])) {
		// 获得当前关卡
		_currentLevel = level;
		// 创建背景
		CCSprite *bgSprite = [CCSprite spriteWithFile:@"bg.png"];
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		bgSprite.position = ccp(winSize.width/2, winSize.height/2);
		[self addChild:bgSprite];
		
		// 弹弓的左边
		CCSprite *leftshot = [CCSprite spriteWithFile:@"leftshot.png"];
		leftshot.position = ccp(85, 110);
		[self addChild:leftshot];
		
		// 弹弓的右边
		CCSprite *rightshot = [CCSprite spriteWithFile:@"rightshot.png"];
		rightshot.position = ccp(85, 110);
		[self addChild:rightshot];
		
		// 画两条拉弹弓的线
		_slingShot = [[SlingShot alloc] init];
		// 设置抗锯齿
		[[_slingShot texture] setAntiAliasTexParameters];
		_slingShot.startPoint1 = ccp(82, 130);
		_slingShot.startPoint2 = ccp(92, 128);
		_slingShot.endPoint = SLINGSHOT_POS;
		_slingShot.contentSize = CGSizeMake(480, 320);
		_slingShot.position = ccp(240, 160);
		[self addChild:_slingShot];
		
		// 激活触摸事件
		[[[CCDirector sharedDirector] touchDispatcher]
			addTargetedDelegate:self priority:kCCMenuHandlerPriority swallowsTouches:YES];

		// 创建一个世界
		[self createBox2DWorld];
		
		// 读取关卡，创建小鸟、猪和冰块
		[self createLevel];
		
		// 初始化一个小鸟跳到弹弓上
		[self jump];
	}
	return self;
}

-(void) createBox2DWorld{
	
	CGSize winSize = [[CCDirector sharedDirector] winSize];
	// 重力加速度
	b2Vec2 gravity;
	// -5.0f y 向下的重力加速度
	gravity.Set(0.0f, -5.0f);
	// 创建一个世界
	_world = new b2World(gravity);
	// 设置如果世界中没有运动的物体，停止模拟
	_world->SetAllowSleeping(true);
	// 设置检测连续碰撞
	_world->SetContinuousPhysics(true);
	
	// 注册物理碰撞监听
	_contactListener = new MyContactListener(_world,self);
	_world->SetContactListener(_contactListener);

	
	// 创建地面刚体
	b2BodyDef groundDef;
	groundDef.position.Set(0, 0);
	b2Body *groundBody = _world -> CreateBody(&groundDef);
	// b2Fixture 给物体设置特性  定义地面形状
	b2EdgeShape groundShape;
	// PTM_RATIO为32，每32 point表示1米，96为地面高度
	groundShape.Set(b2Vec2(0,96/PTM_RATIO)
		, b2Vec2(winSize.width/PTM_RATIO,96/PTM_RATIO));
	groundBody->CreateFixture(&groundShape, 0);
	
	// 启动一个定时器  每隔1/60调用
	[self scheduleUpdate];
	
}


-(void) createLevel{
	// 读取关卡文件 x.data
	NSString* levelStr = [NSString stringWithFormat:@"%d",_currentLevel];
	NSString *path = [[NSBundle mainBundle] pathForResource:levelStr ofType:@"data"];
	// 获取JSON数据中的所有数据返回数组
	NSArray* spriteArray = [JsonParser getAllSpriteWithFile:path];
	// 循环遍历数组中的每一个元素SpriteData，根据Sprite类型初始化pig or ice
	for (SpriteData *data in spriteArray) {
		// pig.tag = 2 ice.tag = 3
		switch (data.tag) {
			case PIG_TAG:
			{
				// 创建pig精灵对象并添加到当前层
				CCSprite *pig = [[Pig alloc] initWithX:data.x andY:data.y andWorld:_world];
				[self addChild:pig];
				break;
			}
			case ICE_TAG:
			{
				// 创建pig精灵对象并添加到当前层
				CCSprite *ice = [[Ice alloc] initWithX:data.x andY:data.y andWorld:_world];
				[self addChild:ice];
				break;
			}
			default:
				break;
		}
	}
	// 创建3个小鸟，添加到屏幕和一个数组当中
	Bird *bird = [[Bird alloc] initWithX:160 andY:93 andWorld:_world];
	Bird *bird2 = [[Bird alloc] initWithX:140 andY:93 andWorld:_world];
	Bird *bird3 = [[Bird alloc] initWithX:120 andY:93 andWorld:_world];
	[self addChild:bird];
	[self addChild:bird2];
	[self addChild:bird3];
	_birds = [CCArray array];
	[_birds addObject:bird];
	[_birds addObject:bird2];
	[_birds addObject:bird3];
}

// 一个小鸟跳到弹弓上
- (void) jump {
	if (_birds.count > 0 && !_isFinish) {
		// 取数组第一个小鸟为currentBird
		_currentBird = [_birds objectAtIndex:0];
		// 跳跃动作
		CCJumpTo *action = [CCJumpTo actionWithDuration:2 position:SLINGSHOT_POS height:50 jumps:1];
		CCCallBlockN *jumpFinish = [CCCallBlock actionWithBlock:^(){
			// 游戏开始标记
			if(!_isFinish){
				_isStart = YES;
			}
			// 小鸟是否准备好标记
			if(!_currentBird.isReady){
				_currentBird.isReady = YES;
			}
		}];
		// 动作序列 执行完action后在执行jumpFinish动作
		CCSequence *allActions = [CCSequence actions:action, jumpFinish, nil];
		[_currentBird runAction:allActions];
	}
}

/*************Touch相关方法 注意：如果ccTouchBegan返回NO，会进入上层的ccTouchBegan方法*******************/
#define TOUCH_UNKNOW 0
#define TOUCH_SELECT 1

// 根据精灵所在位置和精灵的实际大小计算出一个矩形区域代表精灵的可碰撞区域
-(CGRect) rectOfSprite:(CCSprite*)sprite{
	// 返回的可触碰区域为精灵实际大小的4倍
	return CGRectMake(sprite.position.x-sprite.contentSize.width/2,
		sprite.position.y - sprite.contentSize.height/2,
		sprite.contentSize.width + sprite.contentSize.width/2,
		sprite.contentSize.height + sprite.contentSize.height/2);
}
- (BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
	// 判断时候触摸点是否落在_currentBird的可触碰区域内
	_touchStatus = TOUCH_UNKNOW;
	CGPoint location = [self convertTouchToNodeSpace:touch];
	if (_currentBird == nil) {
		return NO;
	}
	// 取得bird的可触碰区域
	CGRect birdRect = [self rectOfSprite:_currentBird];
	// 判断触摸点是否落在bird的可触碰区域
	if (_currentBird.isReady && CGRectContainsPoint(birdRect, location)) {
		//  判断触摸点是否落在bird区域
		_touchStatus = TOUCH_SELECT;
		return YES;
	}
	return NO;
}
//  触摸过程中
- (void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
	// 说明选中小鸟，可以拉动弹弓
	if (_touchStatus == TOUCH_SELECT) {
		// 取得当前手指的点
		CGPoint location = [self convertTouchToNodeSpace:touch];
		// 控制弹弓最远的拉伸距离
		location.x = MAX(SLINGSHOT_POS.x-70,location.x);
		location.x = MIN(SLINGSHOT_POS.x+70,location.x);
		location.y = MAX(SLINGSHOT_POS.y-25,location.y);
		location.y = MIN(SLINGSHOT_POS.y+70,location.y);
		// 把小鸟和弹弓的位置都设置为location;
		_slingShot.endPoint = location;
		_currentBird.position = location;
	}
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
	// 1.让小鸟飞出去，2. 让弹弓复位
	if (_touchStatus == TOUCH_SELECT) {
		//  取得当前手指的点
		CGPoint location = [self convertTouchToNodeSpace:touch];
		// 设置弹弓的endPoint 为初始点
		_slingShot.endPoint = SLINGSHOT_POS;
		/*
		以下代码是直线行走，应该让小鸟按物理引擎规则改变位置
		 // 计算斜率
		CGFloat r = (SLINGSHOT_POS.y - location.y) / (SLINGSHOT_POS.x - location.x);
		CGFloat endx = 300;
		CGFloat endy = endx * r + location.y;
		CGPoint destPoint = ccp(endx, endy);
		 // 移动动作
		CCMoveTo *moveTo = [CCMoveTo actionWithDuration:1.0f position:destPoint];
		[_currentBird runAction:moveTo];
		*/

		// 设置弹弓拉伸的x和y，不能无限拉伸使弹力加大
		float x =(85.0f-location.x)*50.0f/60.0f;
		float y =(125.0f-location.y)*50.0f/60.0f;
		// 调用方法创建小鸟的刚体
		[_currentBird setBodyWithX:x andY:y andWorld:_world];
		// 小鸟弹出后从数组删除
		[_birds removeObject:_currentBird];
		_currentBird = nil;
		// 2秒后让下一个小鸟跳到弹弓上
		[self performSelector:@selector(jump) withObject:nil afterDelay:2.0f];
	}
}



-(void) update:(ccTime) dt{
	 int32 velocityIterations = 8;
	 int32 positionIterations = 1;
	// 让Box2D接管世界
	_world->Step(dt, velocityIterations, positionIterations);
	// 更新cocos2d的界面
	for (b2Body *b = _world->GetBodyList(); b; b=b->GetNext()) {
		// GetUserData()表示每个刚体可以存放一些私有数据
		// （一般存储CCSprite对象，地板则没有）
		if(b->GetUserData() != NULL){
			BaseSprite *currSprite = (__bridge BaseSprite*)b->GetUserData();
			// 取得当前刚体的x，y转成点，设置到精灵的position
			currSprite.position = ccp(b->GetPosition().x * PTM_RATIO
				, b->GetPosition().y * PTM_RATIO);
			// 把Box2D里的角度转成cocos2d的角度
			currSprite.rotation = -1 * CC_RADIANS_TO_DEGREES(b->GetAngle());
			// 如果精灵的生命值为0，或者精灵移动到了屏幕之外，
			// 删除精灵管理的物体和精灵对象
			if (currSprite.HP <= 0 || currSprite.position.x > 480
				|| currSprite.position.y < 84) {
				_world->DestroyBody(b);
				[self removeChild:currSprite cleanup:YES];
			}
		}
	}
	
	// 如果没有小猪，游戏胜利
	if (![self hasPig]) {
		[self gameOver:@"过关"];
	}else{
		// 如果没有小鸟，游戏失败
		if (![self hasBird]) {
			[self gameOver:@"再来一次"];
		}
	}
}

-(BOOL) hasPig {
	CCArray *array = [self children];
	for (int i = 0; i < array.count; i++) {
		CCNode *node = [array objectAtIndex:i];
		// 如果有小猪，直接返回YES
		if (node.tag == 2) {
			return YES;
		}
	}
	return NO;
}

-(BOOL) hasBird {
	CCArray *array = [self children];
	for (int i = 0; i < array.count; i++) {
		CCNode *node = [array objectAtIndex:i];
		if (node.tag == 1) {
			return YES;
		}
	}
	return NO;
}

// 游戏结束方法
-(void) gameOver:(NSString*) labelString{
	
	// 如果当前关卡是已开放的最大关卡，过关后关卡数+1
	if (_currentLevel == [LevelUtils readLevelFromFile]) {
		[LevelUtils writeLevelToFile:_currentLevel+1];
	}
	
	CGSize winSize = [[CCDirector sharedDirector] winSize];
	// 停止所有动作
	[self unscheduleUpdate];
	
	CCSprite *finishSprite = [CCSprite spriteWithFile:@"finish.png"];
	finishSprite.position =ccp( winSize.width /2 , winSize.height/2 );
	finishSprite.scale = 0.7;
	[self addChild:finishSprite];
	
	NSString *levelString = [NSString stringWithFormat:@"第%d关",_currentLevel];
	CCLabelTTF *levelLabel = [CCLabelTTF labelWithString:levelString 
		fontName:@"Marker Felt" fontSize:64];
	[levelLabel setColor:ccc3(255,0,0)];
	levelLabel.scale = 0.6;
	[levelLabel setFontSize:35.0f];
	levelLabel.position = ccp(winSize.width/2, winSize.height/2+68);
	[self addChild:levelLabel];
	
	CCLabelTTF *messageLabel = [CCLabelTTF labelWithString:labelString
		fontName:@"Marker Felt" fontSize:64];
	[messageLabel setColor:ccc3(255,0,0)];
	messageLabel.scale = 0.6;
	messageLabel.position = ccp(winSize.width/2, winSize.height/2-25);
	[self addChild:messageLabel];

	// 创建使用menu.png图片的菜单项，该菜单项用于选关	
	CCMenuItemImage *menuItem1 = [CCMenuItemImage 
		itemWithNormalImage:@"menu.png" selectedImage:@"menu.png"
		block:^(id sender){
			CCScene* scene = [LevelLayer scene];
			CCTransitionScene *transition = [[CCTransitionSplitRows alloc]
				initWithDuration:2.0f scene:scene];
			[[CCDirector sharedDirector] replaceScene:transition];
		}];
	menuItem1.scale = 0.7;
	menuItem1.position =ccp( winSize.width /2-70 , winSize.height/2-90 );
	// 创建使用restart.png图片的菜单项，该菜单项用于重新开始	
	CCMenuItemImage *menuItem2 = [CCMenuItemImage 
		itemWithNormalImage:@"restart.png" selectedImage:@"restart.png"
		block:^(id sender){
			CCScene *scene = [GameLayer sceneWithLevel:_currentLevel];
			CCTransitionScene *transition = [[CCTransitionSplitRows alloc] initWithDuration:2.0f scene:scene];
			[[CCDirector sharedDirector] replaceScene:transition];
		}];
	menuItem2.scale = 0.7;
	menuItem2.position =ccp( winSize.width /2 , winSize.height/2-90 );
	// 创建使用next.png图片的菜单项，该菜单项用于进入下一关
	CCMenuItemImage *menuItem3 = [CCMenuItemImage 
		itemWithNormalImage:@"next.png" selectedImage:@"next.png"
		block:^(id sender){
			CCScene *scene = [GameLayer sceneWithLevel:_currentLevel+1];
			CCTransitionScene *transition = [[CCTransitionSplitRows alloc]
				initWithDuration:2.0f scene:scene];
			[[CCDirector sharedDirector] replaceScene:transition];
			
		}];
	menuItem3.scale = 0.7;
	menuItem3.position =ccp( winSize.width /2+70 , winSize.height/2-90 );
	
	CCMenu* menu = [CCMenu menuWithItems:menuItem1,menuItem2,menuItem3, nil];
	menu.position = CGPointZero;
	[self addChild:menu];
}

@end
