//
//  HelloWorldLayer.m
//  Airfight
//
//  Created by Jason on 13-9-25.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "FKSprite.h"
#import "SimpleAudioEngine.h"
#import "CCParallaxNode-Extras.h"

#pragma mark - HelloWorldLayer

// 精灵表单tag
static NSInteger kTagBatchNode = 1;
// 玩家飞机变量
CCSprite* planeSprite;
// 屏幕宽度、高度的变量
NSInteger screenWidth , screenHeight;
// CCParallaxNode（视差视图）变量，用来完成背景滚动效果
CCParallaxNode* backgroundNode;
// 敌机数组
CCArray* enemyPlaneArray;
// 游戏帧计数器
NSInteger count;
// 代表子弹精灵数组
CCArray* bulletArray;
// 分数值标签
CCLabelTTF* scoreLabel;
// 分数
int scoreValue;
// Boss
FKSprite* bossSprite;
// Boss子弹精灵数组
CCArray* bossBulletArray;
// 是否启动Boss和Boss是否发射子弹
BOOL isStartBoss,isMoveBoss,isShootingBoss,isTemp,isGameOver;
CCSpriteBatchNode* batchNode;


@interface HelloWorldLayer()
// 背景图片滚动
-(void) updateBackground:(ccTime)delay;
/*****************动画************/
// 获取动画帧
-(CCAnimation*) getAnimationByName:(NSString*)animName
							 delay:(float) delay animNum:(int) num;
// 播放爆炸动画
-(void) bombAnimate:(NSString*) name : (CGPoint) position;
/*****************飞机************/
// 更新敌机
-(void) updateEnemySprite:(ccTime)delta;
// 敌机离开屏幕删除
-(void) removeEnemySprite:(ccTime)delta;
/*****************子弹************/
// 更新子弹
-(void) updateShooting:(ccTime)delta;
// 子弹离开屏幕删除
-(void) removeBulletSprite:(ccTime)delta;
// 碰撞检测
-(void) collisionDetection:(ccTime)delta;
/*****************Boss************/
// 出动Boss
-(void) startBossSprite:(ccTime)delta;
// Boss在屏幕上不规则移动
-(void) moveBossSprite:(ccTime)delta;
// Boss更新子弹
-(void) updateBossShooting:(ccTime)delta;

-(void) updateHUD:(ccTime)delta;
-(void) gameOver:(NSString*) labelString;
// 游戏重新开始方法
-(void) onRestartGame:(id)sender;
@end;

// HelloWorldLayer implementation
@implementation HelloWorldLayer

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
		// ①本例使用精灵表单来优化游戏性能，
		// CCSpriteBatchNode中的所有CCSprite只会被渲染1次，因此可以提高游戏的FPS。
		batchNode = [CCSpriteBatchNode batchNodeWithFile:@"airfightSheet.png"];
		batchNode.position = CGPointZero;
		[self addChild:batchNode z:0 tag:kTagBatchNode];
		// 获取屏幕宽度和高度
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		screenWidth = winSize.width;
		screenHeight = winSize.height;
		// ②添加背景图片
		/*CCSprite* bgSprite = [CCSprite spriteWithSpriteFrameName:@"bg1.png"];
		bgSprite.position = ccp(screenWidth/2,screenHeight/2);
		[batchNode addChild:bgSprite];*/
	}
	return self;
}

// 节点调用init方法以后将会调用此方法
-(void) onEnter{
	[super onEnter];
	// 设置初始BOOL值
	isGameOver = NO;
	isStartBoss = NO;
	isShootingBoss = NO;
	isMoveBoss = NO;
	isTemp = NO;
	// ②添加连续滚动背景
	// 初始化CCParallaxNode添加到当前层中
	backgroundNode = [CCParallaxNode node];
	[self addChild:backgroundNode z:-1];
	// ratio指在CCParallaxNode移动时，添加进去的Sprite的移动速度和CCParallaxNode的比率
	CGPoint ratio = ccp(1.0,1.0);
	// 屏幕高度480是iPhone Retina(3.5-inch) 568是iPhone Retina(4-inch)
	NSString *bgName;
	if (screenHeight == 480) {
		bgName = @"bg1.png"; // 640*960
	}else{
		bgName = @"bg2.png"; // 640*1136
	}
	// 第一张背景图
	CCSprite *bgSprite1 = [CCSprite spriteWithFile:bgName];
	// setAliasTexParameters用于解决拼接的地图在连接滚动时容易形成黑色缝隙的问题
	[[bgSprite1 texture] setAliasTexParameters];
	bgSprite1.anchorPoint = ccp(0,0);
	[backgroundNode addChild:bgSprite1 z:1 parallaxRatio:ratio positionOffset:ccp(0,0)];
	// 第二张背景图
	CCSprite *bgSprite2 = [CCSprite spriteWithFile:bgName];
	[[bgSprite2 texture] setAliasTexParameters];
	bgSprite2.anchorPoint = ccp(0,0);
	// positionOffset时在第二个背景图与第一个背景图拼接处减去1个像素，可以消除地图拼接的缝隙
	[backgroundNode addChild:bgSprite2 z:1 parallaxRatio:ratio
				  positionOffset:ccp(0,screenHeight - 1)];
	// 添加开始连续滚动背景的代码
	const int MAX_WIDTH = 320;
	const int MAX_HEIGHT = 480 * 100;
	CCSprite *hiddenPlaneSprite = [CCSprite spriteWithSpriteFrameName:@"plane0.png"];
	hiddenPlaneSprite.visible = NO;
	hiddenPlaneSprite.position = ccp(screenWidth / 2, screenHeight / 2);
	[batchNode addChild:hiddenPlaneSprite z:-4 tag:1024];
	id move = [CCMoveBy actionWithDuration:300.0f position:ccp(0,MAX_HEIGHT)];
	[hiddenPlaneSprite runAction:move];
	// 让背景开始滚动,背景跟随隐形飞机移动
	[backgroundNode runAction:[CCFollow actionWithTarget:hiddenPlaneSprite
		worldBoundary:CGRectMake(0, 0, MAX_WIDTH, MAX_HEIGHT)]];
	// ③.添加玩家飞机精灵
	planeSprite = [CCSprite spriteWithSpriteFrameName:@"plane0.png"];
	planeSprite.position = ccp(screenWidth/2, planeSprite.contentSize.height/2+5);
	[batchNode addChild:planeSprite];
	// ④玩家飞机动画（尾部喷火）
	CCAnimation* planeFlyAnimation = [self getAnimationByName:@"plane" delay:0.08 animNum:2];
	// 重复动作
	id planeFlyAction = [CCRepeatForever actionWithAction:
		[CCAnimate actionWithAnimation:planeFlyAnimation]];
	// 执行动作，达到飞机尾部喷火效果
	[planeSprite runAction:planeFlyAction];
	/**
	⑤这是一种新的方式来激活层的touch事件
	老的方式是，设置层的isTouchEnabled属性为Yes，然后实现ccTouchesBegan方法
	ccTouchBegan方法return 的值，如果是真则表明用户触摸事件已经被处理，其他不会再去进行监听；
	如果为假，则会继续交给其他注册过的类型中进行处理；
	*/
	[[[CCDirector sharedDirector] touchDispatcher]
	addTargetedDelegate:self priority:0 swallowsTouches:YES];
	// ⑥初始化容纳所有敌机、所有子弹、所有爆炸效果的NSMutableArray集合
	enemyPlaneArray = [[CCArray alloc] init];
	bulletArray = [[CCArray alloc] init];
	// 初始化分数标签
	scoreLabel = [CCLabelTTF labelWithString:@"00" fontName:@"Arial" fontSize:20];
	scoreLabel.position = ccp(30, screenHeight*0.98);
	[self addChild:scoreLabel];
	// 初始化分数值
	scoreValue = 0;
	// ⑦播放背景音乐
	[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"s3.wav" loop:YES];
	// 设置背景音量 1 表示最大  0.5表示一半
	[[SimpleAudioEngine sharedEngine] setBackgroundMusicVolume:0.5];
	// ⑥游戏主循环,每帧都调用的更新方法
	// 这样以默认cocos2d的刷新频率1/60.0s调用(void)update:(ccTime)delta一次
	[self scheduleUpdate];
}

/************************主循环方法******************************************/
// 每秒调用更新更新游戏的状态，玩家和敌人的数量，碰撞处理的逻辑等等
-(void) update:(ccTime)delta{
	// 背景不停移动，HUD不断刷新
	[self updateBackground:delta];
	[self updateHUD:delta];
	if (!isGameOver) {
		count++;
		[self updateEnemySprite:delta];
		[self removeEnemySprite:delta];
		[self updateShooting:delta];
		[self removeBulletSprite:delta];
		[self collisionDetection:delta];
		[self startBossSprite:delta];
		[self moveBossSprite:delta];
		[self updateBossShooting:delta];
	}
}
/************************Touch相关方法******************************************/
// ccTouchBegan方法基于用户的touch事件调用上面的方法
-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
	return TRUE;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
	// 把touch坐标转换成局部node坐标
	CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
	// 把旧坐标也转换成局部node坐标
	CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
	oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
	oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
	// ccpSub计算两点的差异，即计算touch偏移量，通过把当前的点坐标减去上一个点坐标
	CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
	// ccpAdd让两个坐标相加
	CGPoint newPos = ccpAdd(planeSprite.position, translation);
	// 给玩家飞机精灵设置新的坐标位置
	planeSprite.position = newPos;
}

// 更新背景图片滚动
-(void) updateBackground:(ccTime)delay{
	CCSprite *sprite;
	int index = 0;
	CCARRAY_FOREACH([backgroundNode children],sprite)
	{
		CGPoint pt = [backgroundNode convertToWorldSpace:sprite.position];
		if (pt.y <= -sprite.contentSize.height) {
			// sprite.contentSize.height表示精灵的高度，即背景图片的高度
			[backgroundNode incrementOffset:ccp(0,(sprite.contentSize.height - 1) * 2.0f) forChild:sprite];
		}
		index++;
	}
}

/****************************动画相关方法**********************************************/
/**
 根据动画帧的名字animName和动画帧的数量num,以及动画帧与帧之间的间隔创建CCAnimation动画.
 注意:
 1. 动画帧的命名必须带序号,比如xxx1.png,xxx2.png
 2. 动画帧的命名必须连续,而且必须从1开始命名
 如果不满足以上条件,使用此方法创建动画就会报错
 getAnimationByName: delay: animNum:
 */
-(CCAnimation*)getAnimationByName:(NSString *)animName delay:(float)delay animNum:(int)num{
	NSMutableArray *animeFrames = [NSMutableArray arrayWithCapacity:num];
	for (int i=0; i< num; i++) {
		// 获取动画图片名称
		NSString *frameName = [NSString stringWithFormat:@"%@%d.png",animName,i];
		// 根据图片名称获取动画帧
		CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
			spriteFrameByName:frameName];
		[animeFrames addObject:frame];
	}
	return [CCAnimation animationWithSpriteFrames:animeFrames delay:delay];
}

// 播放爆炸动画
-(void) bombAnimate:(NSString*) name : (CGPoint) position {
	NSString* bombName = [NSString stringWithFormat:@"%@0.png",name];
	float delay = 0.08f;
	if ([name isEqualToString:@"bomb"]) {
		delay = 0.9f;
	}
	CCSpriteBatchNode *batchNode = (CCSpriteBatchNode*)[self getChildByTag:kTagBatchNode];
	CCSprite* blastSprite = [CCSprite spriteWithSpriteFrameName:bombName];
	blastSprite.position = position;
	// 获得动画帧
	CCAnimation* blastAnimation = [self getAnimationByName:name
													 delay:delay  animNum:4];
	// 组合动作：1.播放动画 2.删除动画精灵对象
	id action = [CCSequence actions:
				 [CCAnimate actionWithAnimation:blastAnimation],
				 [CCCallBlock actionWithBlock:^() {
		[batchNode removeChild:blastSprite cleanup:YES];
	}],nil];
	[blastSprite runAction:action];
	[batchNode addChild:blastSprite z:4];
}

/*************************敌机相关方法*****************************************/
// 更新玩家敌机的方法
-(void) updateEnemySprite:(ccTime)delta{
	// 控制count为100的倍数时添加一架敌机
	if (count % 30 == 0 && !isStartBoss)
	{
		// FKSprite精灵对象继承自CCSprite，增加了生命值
		FKSprite* enemyPlaneSprite;
		// 根据rand随机数添加不同的敌机
		int rand = arc4random() % 2;
		// 使用随机数来设置敌机的X坐标
		int randX = arc4random() % (screenWidth - 40) + 20;
		switch(rand)
		{
			case 0:
				// 创建代表敌机
				enemyPlaneSprite = [FKSprite spriteWithSpriteFrameName:@"e0.png"];
				enemyPlaneSprite.position = ccp(randX, 480+enemyPlaneSprite.contentSize.height);
				enemyPlaneSprite.name = @"e0";
				enemyPlaneSprite.lifeValue = 1;
				break;
			case 1:
				// 创建代表敌机
				enemyPlaneSprite = [FKSprite spriteWithSpriteFrameName:@"e2.png"];
				enemyPlaneSprite.position = ccp(randX, 480+enemyPlaneSprite.contentSize.height);
				enemyPlaneSprite.name = @"e2";
				enemyPlaneSprite.lifeValue = 1;
				break;
		}
		// 获取随机时间(敌机掉落的时间)
		float durationTime = arc4random() %2 + 2;
		// 敌机俯冲
		id moveBy = [CCMoveBy actionWithDuration:durationTime
										position:ccp(0, -enemyPlaneSprite.position.y-enemyPlaneSprite.contentSize.height)];
		[enemyPlaneSprite runAction:moveBy];
		// 将敌机精灵添加到敌机数组
		[enemyPlaneArray addObject:enemyPlaneSprite];
		// 获得精灵表单
		CCSpriteBatchNode *batchNode = (CCSpriteBatchNode*)[self getChildByTag:kTagBatchNode];
		[batchNode addChild:enemyPlaneSprite z:4];
	}else{
		if (count % 200 == 0 && !isStartBoss)
		{
			int randX = arc4random() % (screenWidth - 40) + 20;
			// FKSprite精灵对象继承自CCSprite，增加了生命值
			FKSprite* enemyPlaneSprite;
			// 创建代表敌机
			enemyPlaneSprite = [FKSprite spriteWithSpriteFrameName:@"e1.png"];
			enemyPlaneSprite.position = ccp(randX, 480+enemyPlaneSprite.contentSize.height);
			enemyPlaneSprite.name = @"e1";
			enemyPlaneSprite.lifeValue = 10;
			// 获取随机时间(敌机掉落的时间)
			float durationTime = arc4random() %2 + 2;
			// 敌机俯冲
			id moveBy = [CCMoveBy actionWithDuration:durationTime
											position:ccp(0, -enemyPlaneSprite.position.y-enemyPlaneSprite.contentSize.height)];
			[enemyPlaneSprite runAction:moveBy];
			// 将敌机精灵添加到敌机数组
			[enemyPlaneArray addObject:enemyPlaneSprite];
			// 获得精灵表单
			CCSpriteBatchNode *batchNode = (CCSpriteBatchNode*)[self getChildByTag:kTagBatchNode];
			[batchNode addChild:enemyPlaneSprite z:4];
			// 创建一个进度条精灵
			CCSprite* barSprite = [CCSprite spriteWithFile:@"planeHP.png"];
			// 初始一个CCProgressTimer对象
			CCProgressTimer* enemyPlaneHP = [CCProgressTimer progressWithSprite:barSprite];
			// setPercentage:0.0f,表示并未加载任何资源,表现在画面上就是什么也看不见
			[enemyPlaneHP setPercentage:0.0f];
			// 由于图片大小关系,把scale设置成0.15,即缩小一半
			enemyPlaneHP.scale = 0.15;
			// 表示进度条动画的起始位置,默认在图片的中点,如果想要显示从右到左的一个动画效果,必须改成(0,y)
			enemyPlaneHP.midpoint = ccp(0,0.5);
			// 表示十分改变水平或者垂直方向的比例,设置成1表示改变,0表示不改变.
			// 本例制作一个从左至右的水平进度条,所以midpoint应该是(0,0.5),
			// 因为x方向需要改变而y不需要,所以barChangeRate = ccp(1, 0)
			enemyPlaneHP.barChangeRate = ccp(1, 0);
			enemyPlaneHP.type = kCCProgressTimerTypeBar;
			enemyPlaneHP.percentage = 100;
			CGPoint pos = enemyPlaneSprite.position;
			enemyPlaneHP.position = ccp(pos.x, pos.y+32);
			[self addChild:enemyPlaneHP];
			id moveBy2 = [CCMoveBy actionWithDuration:durationTime
											 position:ccp(0, -enemyPlaneSprite.position.y-enemyPlaneSprite.contentSize.height)];
			[enemyPlaneHP runAction:moveBy2];
			enemyPlaneSprite.enemyPlaneHP = enemyPlaneHP;
			enemyPlaneSprite.HPInterval = 100.0 / (float)enemyPlaneSprite.lifeValue;
		}
	}
}

-(void) removeEnemySprite:(ccTime)delta{
	// 获得精灵表单
	CCSpriteBatchNode *batchNode = (CCSpriteBatchNode*)[self getChildByTag:kTagBatchNode];
	// 定义循环变量
	CCSprite* enemyPlaneSprite;
	// 遍历所有的敌机精灵
	CCARRAY_FOREACH(enemyPlaneArray, enemyPlaneSprite){
		// 如果敌机已经移出屏幕外，删除敌机精灵
		if (enemyPlaneSprite.position.y <= -enemyPlaneSprite.contentSize.height)
		{
			// 从精灵表单删除该敌机精灵
			[batchNode removeChild:enemyPlaneSprite cleanup:YES];
			// 从enemyPlaneArray集合中删除敌机精灵
			[enemyPlaneArray removeObject:enemyPlaneSprite];
		}
	}
}

/************************子弹相关方法******************************************/
// 玩家飞机不断发送子弹的方法
-(void) updateShooting:(ccTime)delta{
	// 获得精灵表单
	CCSpriteBatchNode *batchNode = (CCSpriteBatchNode*)[self getChildByTag:kTagBatchNode];
	// 飞机精灵坐标
	CGPoint pos = planeSprite.position;
	// 控制count为8的倍数时发射一颗子弹
	if(count % 8 == 0)
	{
		// 创建代表子弹的精灵
		CCSprite* bulletSprite = [CCSprite spriteWithSpriteFrameName:@"bullet.png"];
		// 设置子弹坐标
		CGPoint bulletPos = ccp(pos.x, pos.y +
								planeSprite.contentSize.height/2 + bulletSprite.contentSize.height);
		bulletSprite.position = bulletPos;
		// 子弹移动时间为0.4秒,移动距离为屏幕高度-子弹的y轴
		id moveBy = [CCMoveBy actionWithDuration:0.4f position:ccp(0, screenHeight - bulletPos.y)];
		[bulletSprite runAction:moveBy];
		// 将子弹精灵添加到精灵表单
		[batchNode addChild:bulletSprite z:4];
		// 将子弹精灵添加到子弹精灵数组
		[bulletArray addObject:bulletSprite];
	}
}

-(void) removeBulletSprite:(ccTime)delta{
	// 获得精灵表单
	CCSpriteBatchNode *batchNode = (CCSpriteBatchNode*)[self getChildByTag:kTagBatchNode];
	CCSprite* bulletSprite;
	// 遍历所有的子弹
	CCARRAY_FOREACH(bulletArray, bulletSprite){
		// 如果子弹已经移出屏幕外，删除子弹
		if (bulletSprite.position.y >=screenHeight){
			// 从精灵表单删除该子弹精灵
			[batchNode removeChild:bulletSprite cleanup:YES];
			// 从子弹数组中删除子弹精灵
			[bulletArray removeObject:bulletSprite];
		}
	}
}

// 检测碰撞的方法
-(void) collisionDetection:(ccTime)dt{
	// 获得精灵表单
	CCSpriteBatchNode *batchNode = (CCSpriteBatchNode*)[self getChildByTag:kTagBatchNode];
	// 定义循环变量
	FKSprite* enemyPlaneSprite;
	CCSprite* bulletSprite;
	// 遍历敌机数组
	CCARRAY_FOREACH(enemyPlaneArray, enemyPlaneSprite){
		// 玩家飞机和敌机发生碰撞
		if(CGRectIntersectsRect(planeSprite.boundingBox,enemyPlaneSprite.boundingBox))
		{
			// 播放爆炸动画
			[self bombAnimate:@"blast" :enemyPlaneSprite.position ];
			// 删除敌机精灵
			[enemyPlaneArray removeObject:enemyPlaneSprite];
			[batchNode removeChild:enemyPlaneSprite cleanup:YES];
			[planeSprite stopAllActions];
			// 删除玩家精灵
			[batchNode removeChild:planeSprite cleanup:YES];
			[self gameOver:@"游戏结束!"];
		}
		// 遍历子弹数组
		CCARRAY_FOREACH(bulletArray, bulletSprite){
			// 如果敌机与子弹发生了碰撞
			if(CGRectIntersectsRect(enemyPlaneSprite.boundingBox, bulletSprite.boundingBox))
			{
				// 播放子弹音效
				[[SimpleAudioEngine sharedEngine] playEffect:@"bullet.mp3"];
				// 删除子弹精灵
				[bulletArray removeObject:bulletSprite];
				[batchNode removeChild:bulletSprite cleanup:YES];
				// 敌机生命值减1
				enemyPlaneSprite.lifeValue--;
				// 血条减少
				if (enemyPlaneSprite.enemyPlaneHP != nil) {
					enemyPlaneSprite.enemyPlaneHP.percentage
					= enemyPlaneSprite.HPInterval * enemyPlaneSprite.lifeValue;
				}
				// 判断敌机的生命值
				if (enemyPlaneSprite.lifeValue <= 0) {
					// 删除敌机精灵
					[enemyPlaneArray removeObject:enemyPlaneSprite];
					[batchNode removeChild:enemyPlaneSprite cleanup:YES];
					// 判断飞机得分
					if ([enemyPlaneSprite.name isEqualToString:@"boss"]) {
						// 播放爆炸动画
						[self bombAnimate:@"bomb" :enemyPlaneSprite.position ];
						// 播放爆炸音效
						[[SimpleAudioEngine sharedEngine] playEffect:@"b1.mp3"];
						scoreValue += 5000;
						// 游戏胜利
						[self gameOver:@"游戏胜利!"];
					}else{
						// 播放爆炸动画
						[self bombAnimate:@"blast" :enemyPlaneSprite.position ];
						// 播放爆炸音效
						[[SimpleAudioEngine sharedEngine] playEffect:@"b0.mp3"];
						if ([enemyPlaneSprite.name isEqualToString:@"e1"])
							scoreValue += 500;
						else
							scoreValue += 100;
					}
					// 10000分大Boss出动
					if (scoreValue >= 10000) {
						isStartBoss = YES;
						break;
					}
				}
				break;
			}
		}
		// 判断Boss的子弹和玩家飞机的碰撞
		if (isShootingBoss) {
			CCSprite* bossBulletSprite;
			CCARRAY_FOREACH(bossBulletArray, bossBulletSprite){
				if(CGRectIntersectsRect(planeSprite.boundingBox,bossBulletSprite.boundingBox)){
					[planeSprite stopAllActions];
					// 删除玩家精灵
					[batchNode removeChild:planeSprite cleanup:YES];
					// 爆炸声音
					[[SimpleAudioEngine sharedEngine] playEffect:@"b0.mp3"];
					// 播放爆炸动画
					[self bombAnimate:@"blast" :planeSprite.position ];
					[self gameOver:@"游戏结束!"];
				}
			}
		}
	}
}

/************************Boss相关方法******************************************/
-(void) startBossSprite:(ccTime)delta{
	if(isStartBoss && !isMoveBoss && !isTemp){
		isTemp = YES;
		CCSpriteBatchNode *batchNode = (CCSpriteBatchNode*)[self getChildByTag:kTagBatchNode];
		FKSprite* enemyPlaneSprite;
		// 删除所有敌机
		CCARRAY_FOREACH(enemyPlaneArray, enemyPlaneSprite){
			// 设置和敌机关联的进度条为0
			enemyPlaneSprite.enemyPlaneHP.percentage = 0;
			[batchNode removeChild:enemyPlaneSprite cleanup:YES];
		}
		[enemyPlaneArray removeAllObjects];
		// Boss出动
		bossSprite= [FKSprite spriteWithSpriteFrameName:@"e-10.png"];
		bossSprite.position=ccp(screenWidth/2, screenHeight+bossSprite.contentSize.height);
		bossSprite.name = @"boss";
		bossSprite.lifeValue = 100;
		// 创建一个进度条精灵
		CCSprite* barSprite = [CCSprite spriteWithFile:@"planeHP.png"];
		// 初始一个Boss血条对象
		bossSprite.enemyPlaneHP = [CCProgressTimer progressWithSprite:barSprite];
		// setPercentage:0.0f,表示并未加载任何资源,表现在画面上就是什么也看不见
		[bossSprite.enemyPlaneHP setPercentage:0.0f];
		// 由于图片大小关系,把scale设置成0.5,即缩小一半
		bossSprite.enemyPlaneHP.scale = 0.25;
		bossSprite.enemyPlaneHP.midpoint = ccp(0,0.5);
		bossSprite.enemyPlaneHP.barChangeRate = ccp(1, 0);
		bossSprite.enemyPlaneHP.type = kCCProgressTimerTypeBar;
		bossSprite.enemyPlaneHP.percentage = 100;
		// 设置position在中心点
		[bossSprite.enemyPlaneHP setPosition:ccp(screenWidth/2, screenHeight/2)];
		bossSprite.enemyPlaneHP.visible = NO;
		[self addChild:bossSprite.enemyPlaneHP];
		// 血条更新量  100/10=10
		bossSprite.HPInterval = 100.0 / (float)bossSprite.lifeValue;
		// 将Boss精灵添加到敌机数组
		[enemyPlaneArray addObject:bossSprite];
		[batchNode addChild:bossSprite z:4];
		// Boss移动到屏幕上方
		id moveTo = [CCMoveTo actionWithDuration:2
										position:ccp(screenWidth/2, screenHeight-bossSprite.contentSize.height-20)];
		id action = [CCSequence actions:moveTo,[CCCallBlock actionWithBlock:^(){
			isMoveBoss = YES;
		}], nil] ;
		[bossSprite runAction:action];
		// 初始化Boss子弹数组
		bossBulletArray = [[CCArray alloc] init];
	}
}

-(void) moveBossSprite:(ccTime)delta{
	if(isMoveBoss && !isShootingBoss){
		isShootingBoss = YES;
		// 不停的在屏幕上方左右移动
		id moveToLift = [CCMoveTo actionWithDuration:3
											position:ccp(screenWidth-bossSprite.contentSize.width/2, screenHeight-bossSprite.contentSize.height-20)];
		id moveRight = [CCMoveTo actionWithDuration:3
										   position:ccp(0+bossSprite.contentSize.width/2, screenHeight-bossSprite.contentSize.height-20)];
		id delay = [CCDelayTime actionWithDuration:2];
		id sequence = [CCSequence actions:delay,moveToLift,moveRight, nil];
		// 注意：CCSequence中不能包含这个反复的动作。
		id repeat = [CCRepeatForever actionWithAction:sequence];
		[bossSprite runAction:repeat];
	}
}

-(void) updateBossShooting:(ccTime)delta{
	if (isShootingBoss) {
		// Boss精灵坐标
		CGPoint pos = bossSprite.position;
		// 获得精灵表单
		CCSpriteBatchNode *batchNode = (CCSpriteBatchNode*)[self getChildByTag:kTagBatchNode];
		if(count % 80 == 0)
		{
			// 创建代表子弹的精灵
			CCSprite* bossBulletSprite = [CCSprite spriteWithSpriteFrameName:@"bullet1.png"];
			// 设置子弹坐标
			CGPoint bulletPos = ccp(pos.x, pos.y - bossSprite.contentSize.height/2);
			bossBulletSprite.position = bulletPos;
			// 子弹精灵可见
			bossBulletSprite.visible = YES;
			// 子弹移动时间为0.5秒,移动距离为屏幕高度-子弹的y轴
			id moveBy = [CCMoveBy actionWithDuration:2.0f
											position:ccp(0, - screenHeight - bulletPos.y)];
			[bossBulletSprite runAction:moveBy];
			// 添加到Boss子弹数组
			[bossBulletArray addObject:bossBulletSprite];
			// 将子弹精灵添加到精灵表单
			[batchNode addChild:bossBulletSprite z:4];
		}
	}
}

// HUD: Head-UpDisplay,地图、分数、血条、时间进度条和技能条等都是HUD
-(void) updateHUD:(ccTime)delta{
	[scoreLabel setString:[NSString stringWithFormat:@"%i",scoreValue]];
	if (bossSprite != nil) {
		// Boss精灵坐标
		CGPoint pos = bossSprite.position;
		// Boss血条显示坐标位置
		bossSprite.enemyPlaneHP.position = ccp(pos.x, pos.y+55);
		if (!bossSprite.enemyPlaneHP.visible) {
			bossSprite.enemyPlaneHP.visible = YES;
		}
	}
	
}

-(void) gameOver:(NSString*) labelString{
	// 停止所有动作
	[self unscheduleUpdate];
	isGameOver = YES;
	[self scheduleUpdate];
	// 游戏结束
	CCMenuItemFont* gameItem = [CCMenuItemFont itemWithString:labelString
				target:self selector:@selector(onRestartGame:)];
	gameItem.position=ccp(screenWidth/2, screenHeight/2);
	CCMenu* menu = [CCMenu menuWithItems:gameItem, nil];
	menu.position = CGPointZero;
	[self addChild:menu];
}

// 重新启动游戏
-(void) onRestartGame:(id)sender{
	[[CCDirector sharedDirector] replaceScene:[HelloWorldLayer scene]];
}
@end
