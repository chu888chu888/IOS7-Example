//
//  HelloWorldLayer.m
//  Test2
//
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer
@implementation HelloWorldLayer
@synthesize tileMap = _tileMap;
@synthesize player = _player;
@synthesize monsterArray = _monsterArray;
@synthesize gridArray = _gridArray;
@synthesize isMove = _isMove;

CCTMXLayer *collidable; // 障碍层
NSInteger screenWidth , screenHeight; // 屏幕宽度和高度
NSInteger count; // 游戏帧计数器
CGPoint _monsterPos;

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
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

// on "init" you need to initialize your instance
-(id) init
{
	if( (self=[super init]) ) {
		// 获得屏幕大小，赋值给两个变量
		CGSize winSzie = [[CCDirector sharedDirector] winSize];
		screenWidth = winSzie.width;
		screenHeight = winSzie.height;
		// 加入地图
		self.tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"map.tmx"];
		self.tileMap.anchorPoint = CGPointZero;
		self.tileMap.position = CGPointZero;
		// 获取障碍层，并设置障碍层为不可见
		collidable = [self.tileMap layerNamed:@"collidable"];
		collidable.visible = NO;
		
		/********二维数组 初始化读取地图所有网格，确定网格对象是否是障碍物**************/
		self.gridArray = [[NSMutableArray alloc] init];
		// 创建二维数组，给每个数组添加一个元素对象即TileMap的网格对象
		for (int i=0; i<self.tileMap.mapSize.width; i++) {
			[self.gridArray addObject:[[NSMutableArray alloc] init]];
		}
		for (int i = 0; i < self.tileMap.mapSize.width; i++) {
			for (int j = 0; j < self.tileMap.mapSize.height; j++) {
				// 设置网格对象的x轴和y轴以及是否可通过变量值
				Grid *o = [[Grid alloc]init];
				o.x = i;
				o.y = j;
				o.isPass = YES;
				[[self.gridArray objectAtIndex:i] addObject:o];
			}
		}
		// 循环根据每个网格的x轴和y轴查找对应的地图的GID，判断是否可通过，如果不可通过，设置网格对象的isPass变量为NO
		for (int i=0; i<[self.gridArray count]; i++) {
			for (int j=0; j<[[self.gridArray objectAtIndex:i] count]; j++) {
				Grid *o = [[self.gridArray objectAtIndex:i] objectAtIndex:j];
				CGPoint tileCoord = CGPointMake(o.x, o.y);
				// 使用里的tileGIDAt函数获取TileMap坐标系里的GID。GID是“全局唯一标识”
				int tileGid = [collidable tileGIDAt:tileCoord];
				if (tileGid) {
					// 使用GID来查找指定tile的属性的时候。返回一个属性字典
					NSDictionary *properties = [self.tileMap propertiesForGID:tileGid];
					// 遍历字典，判断是否有”可碰撞的“物体，如果有，直接返回
					if (properties) {
						NSString *collision = [properties valueForKey:@"collidable"];
						if (collision && [collision compare:@"true"] == NSOrderedSame) {
							o.isPass = NO;
						}
					}
				}
			}
		}
		/******************************************************************/
		// 玩家X轴镜像反转
		self.player = [CCSprite spriteWithFile:@"player_stand_1.png"];
		self.player.flipX = YES;
		self.player.position = ccp(50, screenHeight/2+120);
		self.isMove = NO;
		// 将玩家精灵和地图添加为当前层的子节点
		[self addChild:self.player z:1];
		[self addChild:self.tileMap];
		// 创建怪物数组对象
		self.monsterArray = [CCArray array];
		// 激活触摸事件
		[[[CCDirector sharedDirector]touchDispatcher]addTargetedDelegate:self 
			priority:0 swallowsTouches:YES];
		// 定时消息
		[self scheduleUpdate];
	}
	return self;
}


// 每次加载场景会调用
-(void) onEnter{
	[super onEnter];
	
}


// 把玩家作为视觉中心来显示，让地图随玩家一起移动
-(void)setViewpointCenter:(CGPoint) position {
	int x = MAX(position.x, screenWidth / 2);
	int y = MAX(position.y, screenHeight / 2);
	// 不让显示区域超出地图的边界
	x = MIN(x, (self.tileMap.mapSize.width * self.tileMap.tileSize.width- screenWidth) / 2);
	y = MIN(y, (self.tileMap.mapSize.height * self.tileMap.tileSize.height- screenHeight)/2);
	CGPoint actualPosition = ccp(x, y);
	CGPoint centerOfView = ccp(screenWidth/2, screenHeight/2);
	// 计算中心位置和玩家位置两点之间的差值
	CGPoint viewPoint = ccpSub(centerOfView, actualPosition);
	self.position = viewPoint;
}



-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	return YES;
}


-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	if (!self.isMove) {
		// isMove变量表示玩家是否正在移动
		self.isMove = YES;
		// UI坐标
		CGPoint touchLocation = [touch locationInView: [touch view]];
		// GL坐标
		touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
		// node坐标
		touchLocation = [self convertToNodeSpace:touchLocation];
		// 玩家镜像反转
		if (self.player.position.x > touchLocation.x) {
			if(self.player.flipX)
				self.player.flipX = NO;
		}else{
			if(!self.player.flipX)
				self.player.flipX = YES;
		}
		// 用玩家位置作为起点，触摸点作为终点，查找最佳路径
		CGPoint from = [self tileCoordForPosition:self.player.position];
		CGPoint to = [self tileCoordForPosition:touchLocation];
		// 如果终点是不可通过的位置，则直接return
		int tileGid = [collidable tileGIDAt:to];
		if (tileGid) {
			NSDictionary *properties = [self.tileMap propertiesForGID:tileGid];
			if (properties) {
				NSString *collision = [properties valueForKey:@"collidable"];
				if (collision && [collision compare:@"true"] == NSOrderedSame) {
					self.isMove = NO;
					return;
				}
			}
		}
		// 获得起点到终点的最佳路径
		PathArithmetic *pa = [PathArithmetic sharedPathArithmetic];
		NSArray *array = [pa getPath:from endPoint:to tileMapGrid:self.gridArray];
		// 玩家根据最佳路径点移动
		[self playerMoveWithWayPoints:touchLocation path:array];
	}
}

// 玩家根据最佳路径点移动
-(void) playerMoveWithWayPoints:(CGPoint)position path:(NSArray*)path{
	// 定义临时数组，用来保存多个moveTo动作
	NSMutableArray* moveArray = [[NSMutableArray alloc] init];
	for (int i = 0; i < [path count]; i++) {
		CGPoint p = [[path objectAtIndex:i] CGPointValue];
		// 设置角色移动的物体遮住效果
		[self updateVertexZ:p sprite:self.player];
		// 将tileMap的网格转成gl坐标，即玩家移动的位置
		CGPoint glPoint = [self locationForTilePos:p];
		// 定义一个动作，让精灵对象移动到指定的位置
		id moveTo = [CCMoveTo actionWithDuration:0.5f position:glPoint];
		// 将该动作添加到临时数组
		[moveArray addObject:moveTo];
	}
	// 获取玩家奔跑动画
	CCAnimate *animAction = [self getAnimationByName:@"player_move_" delay:1.5f animNum:4];
	// 定义一个动作，重复执行CCAnimate动画
	id repeatanimAction = [CCRepeatForever actionWithAction:animAction];
	// 精灵重复执行动画动作
	[self.player runAction:repeatanimAction];
	// 回调方法，精灵到达终点后停止奔跑动画并站立
	CCCallBlock *block= [CCCallBlock actionWithBlock:^{
		[self.player stopAction:repeatanimAction];
		CCTexture2D *spriteTexture = [[CCTextureCache sharedTextureCache] addImage:@"player_stand_1.png"];
		[self.player setTexture:spriteTexture];
		self.isMove = NO;
	}];
	[moveArray addObject:block];
	// 执行一系列的动作
	id sequence = [CCSequence actionWithArray:moveArray];
	[self.player runAction:sequence];
	// 地图随玩家一起移动
	[self setViewpointCenter:position];
}

-(CCAnimate*)getAnimationByName:(NSString *)animName delay:(float)delay animNum:(int)num{
	CCAnimation* anim = [CCAnimation animation];
	for (int i = 1; i <= num; i++) {
		NSString *fileName = [NSString stringWithFormat:@"%@%d.png",animName,i];
		[anim addSpriteFrameWithFilename:fileName];
	}
	// 创建animAction动画，restoreOriginalFrame:YES可以让精灵对象在动画执行完后恢复到最初状态
	CCAnimate *animAction = [CCAnimate actionWithDuration:delay animation:anim restoreOriginalFrame:YES];
	return animAction;
}

/**
 将cocos2d坐标转换为TileMap坐标
 cocos2d的坐标系：左下角为原点，x轴向右，y轴向上，以浮点数为单位；
 tilemap的坐标系：左上角为原点，x轴向右，y轴向下，以整数为单位；
 它标识的不是像素的位置，而是像素所在的网格（tile）的索引。
 所以转换的时候需要网格的高和宽（tileSize.width和tileSize.height）.
 mapSize可以获得tile map的宽和高的索引最大值
 */
- (CGPoint)tileCoordForPosition:(CGPoint)position {
	// CC_CONTENT_SCALE_FACTOR Retina返回2，否则返回1
	// 玩家位置的x除以地图的宽，得到的是地图横向的第几个格子（tile）
	int x = (int)(position.x / (self.tileMap.tileSize.width / CC_CONTENT_SCALE_FACTOR()));
	// 玩家位置的y除以地图的高，得到的是地图纵向第几个格子（tile），
	// 但是因为cocos2d的y轴和tilemap的y轴相反，所以使用地图的高度减去玩家位置的y
	float pointHeight = self.tileMap.tileSize.height / CC_CONTENT_SCALE_FACTOR();
	int y = (int)((self.tileMap.mapSize.height * pointHeight - position.y) / pointHeight);
	return ccp(x, y);
}

// tile坐标转换为gl坐标
-(CGPoint)locationForTilePos:(CGPoint)pos
{
	int x = (int)(pos.x*(self.tileMap.tileSize.width/CC_CONTENT_SCALE_FACTOR()));
	float pointHeight = self.tileMap.tileSize.height / CC_CONTENT_SCALE_FACTOR();// 32
	int y = (int)((self.tileMap.mapSize.height * pointHeight) - (pos.y * pointHeight));
	return ccp(x,y);
}

// 修改vertexZ值
-(void) updateVertexZ: (CGPoint) tilePos sprite:(SpriteBase*)sprite{
	// 最小的vertexZ值，就是地图的高度和宽度的和的负数
	float lowestZ = -(self.tileMap.mapSize.width + self.tileMap.mapSize.height);
	// 当前瓦片的坐标与最小的vertexZ坐标（点（0，0））之间的差值就是该点的x轴和y轴坐标之和。
	float currentZ = tilePos.x + tilePos.y;
	// 最小的vertexZ值 + 当前瓦片的坐标与最小的vertexZ之间的差值 = 当前瓦片坐标的vertexZ值
	sprite.vertexZ = lowestZ + currentZ -2.0f;
}

-(void) update: (ccTime)dt{
	count++;
	[self updateMonsterSprite:dt];
	[self monsterRepeatedlyMove:dt];
	[self collisionDetection:dt];
	[self monsterCollisionDetection:dt];
}

// 随机获得怪物出现的坐标
-(CGPoint) randomPosintion {
	// 使用随机数来设置怪物的X和Y坐标
	 int randX = arc4random() % (screenWidth) + 100;
	 int randY = arc4random() % (screenHeight) + 120;
	 CGPoint posintion = ccp(randX, randY);
	 CGPoint tileCoord = [self tileCoordForPosition:posintion];
	// 如果获取坐标错误，重新获取
	if (tileCoord.x < 0 || tileCoord.x >= self.tileMap.mapSize.width
		|| tileCoord.y < 0 || tileCoord.y >= self.tileMap.mapSize.height) {
		return [self randomPosintion];
	}
	 int tileGid = [collidable tileGIDAt:tileCoord];
	// 如果随机坐标是不可通过的网格位置，则重新获取
	 if (tileGid) {
		 NSDictionary *properties = [self.tileMap propertiesForGID:tileGid];
		 if (properties) {
			 NSString *collision = [properties valueForKey:@"collidable"];
			 if (collision && [collision compare:@"true"] == NSOrderedSame) {
				 return [self randomPosintion];
			 }else{
				 return posintion;
			 }
		 }
	 }
	 return posintion;
}

// 随机出现怪物精灵的方法
-(void) updateMonsterSprite:(ccTime)dt{
	if (count % 200 ==0 && self.monsterArray.count <= 2) {
		SpriteBase *monster;
		monster = [SpriteBase spriteWithFile:@"eagle_move_1.png"];
		monster.scale = 0.7;
		[monster setLifeValue:9];
		monster.moveCount = 1;
		// 随机坐标
		monster.position = [self randomPosintion];
		// 修改怪物的vertexZ值
		[self updateVertexZ:monster.position sprite:monster];
		// 添加到怪物数组
		[self.monsterArray addObject:monster];
		[self addChild:monster];
		// 设置怪物移动标记为NO
		[monster setIsMove:NO];
	}
}

// 随机获得怪物移动的坐标
-(CGPoint) randomMovePosintion:(SpriteBase*)monster {
	// 获得怪物移动位置
	CGPoint position ;
	// 随机获得移动的X值和Y值
	int randX = arc4random() % 200;
	int randY = arc4random() % 100;
	// moveCount单数向左移动，双数向右移动
	if (monster.moveCount %2 == 0) {
		position = ccp(monster.position.x+randX, monster.position.y+randY);
		if (!monster.flipX) {
			monster.flipX = YES;
		}
	}else{
		position = ccp(monster.position.x-randX, monster.position.y-randY);
		if (monster.flipX) {
			monster.flipX = NO;
		}
	}
	CGPoint tileCoord = [self tileCoordForPosition:position];
	// 如果获取坐标错误，重新获取
	if (tileCoord.x < 0 || tileCoord.x >= self.tileMap.mapSize.width
		|| tileCoord.y < 0 || tileCoord.y >= self.tileMap.mapSize.height) {
		return [self randomMovePosintion:monster];
	}
	int tileGid = [collidable tileGIDAt:tileCoord];
	// 如果随机坐标是不可通过的网格位置，则重新获取
	if (tileGid) {
		NSDictionary *properties = [self.tileMap propertiesForGID:tileGid];
		if (properties) {
			NSString *collision = [properties valueForKey:@"collidable"];
			if (collision && [collision compare:@"true"] == NSOrderedSame) {
				return [self randomMovePosintion:monster];
			}else{
				return position;
			}
		}
	}
	return position;
}

// 怪物根据最佳路径点移动
-(void) monsterMoveWithWayPoints:(NSArray*)path monster:(SpriteBase*)monster{
	// 定义临时数组，用来保存多个moveTo动作
	NSMutableArray* moveArray = [[NSMutableArray alloc] init];
	for (int i = 0; i < [path count]; i++) {
		CGPoint p = [[path objectAtIndex:i] CGPointValue];
		// 设置角色移动的物体遮住效果
		[self updateVertexZ:p sprite:monster];
		// 将tileMap的网格转成gl坐标，即玩家移动的位置
		CGPoint glPoint = [self locationForTilePos:p];
		// 定义一个动作，让精灵对象移动到指定的位置
		id moveTo = [CCMoveTo actionWithDuration:1.5f position:glPoint];
		// 将该动作添加到临时数组
		[moveArray addObject:moveTo];
	}
	// 获取怪物奔跑动画
	CCAnimate *animAction = [self getAnimationByName:@"eagle_move_" delay:1.5f animNum:4];
	// 定义一个动作，重复执行CCAnimate动画
	id repeatanimAction = [CCRepeatForever actionWithAction:animAction];
	// 精灵重复执行动画动作
	[monster runAction:repeatanimAction];
	// 回调方法，精灵到达终点后停止奔跑动画并站立
	CCCallBlock *block= [CCCallBlock actionWithBlock:^{
		// 停止动画
		[monster stopAction:repeatanimAction];
		// 设置怪物移动标记为NO
		[monster setIsMove:NO];
		// moveCount自增，用于控制方向
		monster.moveCount++;
	}];
	[moveArray addObject:block];
	// 执行一系列的动作
	id sequence = [CCSequence actionWithArray:moveArray];
	[monster runAction:sequence];
}

// 怪物不规则移动
-(void) monsterRepeatedlyMove:(ccTime)dt{
	SpriteBase *monster;
	CCARRAY_FOREACH(self.monsterArray , monster){
		if (!monster.isMove) {
			// 设置怪物移动标记为YES
			[monster setIsMove:YES];
			// 获得怪物移动位置
			CGPoint position = [self randomMovePosintion:monster];
			// 用怪物位置作为起点，触摸点作为终点，查找最佳路径
			CGPoint from = [self tileCoordForPosition:monster.position];
			CGPoint to = [self tileCoordForPosition:position];
			// 获得起点到终点的最佳路径
			PathArithmetic *pa = [PathArithmetic sharedPathArithmetic];
			NSArray *array = [pa getPath:from endPoint:to tileMapGrid:self.gridArray];
			// 怪物移动
			[self monsterMoveWithWayPoints:array monster:monster];
		}
	}
}

// 怪物和怪物的碰撞需要修改vertexZ值避免精灵重叠视觉效果
-(void) monsterCollisionDetection:(ccTime)dt{
	SpriteBase *monster1;
	CCARRAY_FOREACH(self.monsterArray , monster1){
		SpriteBase *monster2;
		CCARRAY_FOREACH(self.monsterArray , monster2){
			// 如果是两个不同的怪物
			if (monster1 != monster2) {
				// 怪物和怪物的碰撞检测
				if (CGRectIntersectsRect(monster1.boundingBox
					, monster2.boundingBox)) {
					// 怪物1的vertexZ值减1，怪物2的vertexZ值加1，则怪物2显示在怪物1之上
					monster1.vertexZ = monster1.vertexZ - 1;
					monster2.vertexZ = monster2.vertexZ + 1;
				}
			}
		}
	}
}

// 玩家和怪物的碰撞检测方法
-(void) collisionDetection:(ccTime)dt{
	SpriteBase *monster;
	CCARRAY_FOREACH(self.monsterArray,monster){
		// 玩家精灵和怪物精灵发生碰撞
		if (CGRectIntersectsRect(monster.boundingBox, self.player.boundingBox)) {
			// 进入战斗场景
			CCScene* scene = [FightLayer scene];
			// CCTransitionZoomFlipAngular 左右翻轴剧场效果
			CCTransitionScene *transition = [[CCTransitionSplitRows  alloc]
				initWithDuration:2.0f scene:scene];
			// push战斗场景
			[[CCDirector sharedDirector] pushScene:transition];
			// 从当前场景和怪物数组中删除怪物
			[self removeChild:monster cleanup:YES];
			[self.monsterArray removeObject:monster];
		}
	}
}


@end
