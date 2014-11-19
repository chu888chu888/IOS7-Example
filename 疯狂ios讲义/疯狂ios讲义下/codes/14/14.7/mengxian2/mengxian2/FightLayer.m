//
//  FightLayer.m
//  mengxian
//
//

#import "FightLayer.h"
#import "HelloWorldLayer.h"


@implementation FightLayer

@synthesize player = _player;  // 玩家
@synthesize monster = _monster;  // 怪物
BOOL isShooting;  // 玩家是否射箭
NSInteger screenWidth , screenHeight;  // 屏幕宽度和高度

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	FightLayer *layer = [FightLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


-(id) init{
	if( (self=[super init]) ) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		screenWidth = winSize.width;
		screenHeight = winSize.height;
		// 加载战斗背景
		CCSprite *bg = [CCSprite spriteWithFile:@"fight.png"];
		bg.position = ccp(screenWidth/2, screenHeight/2);
		[self addChild:bg];
		// 创建玩家并设置位置
		self.player = [CCSprite spriteWithFile:@"player_stand_2.png"];
		self.player.position = ccp(160, screenHeight/2);
		self.player.flipX = YES;
		isShooting = YES;
		// 创建怪物并设置位置
		self.monster = [SpriteBase spriteWithFile:@"eagle_stand_2.png"];
		self.monster.position = ccp(screenWidth-160, screenHeight/2+30);
		self.monster.lifeValue = 20;
		// 创建怪物血条
		CCSprite* barSprite = [CCSprite spriteWithFile:@"planeHP.png"];
		self.monster.HP = [CCProgressTimer progressWithSprite:barSprite];
		self.monster.HP.percentage = 0.0f;
		self.monster.HP.scale = 0.25;
		self.monster.HP.midpoint = ccp(0,0.5);
		self.monster.HP.barChangeRate = ccp(1, 0);
		self.monster.HP.type = kCCProgressTimerTypeBar;
		self.monster.HP.percentage = 60;
		self.monster.HP.position = ccp(self.monster.position.x+15,self.monster.position.y+39);
		[self addChild:self.monster.HP];
		// 设置血条更新量
		self.monster.HPInterval = self.monster.HP.percentage  / (float)self.monster.lifeValue;
		// 添加玩家和怪物为当前层的子节点
		[self addChild:self.player];
		[self addChild:self.monster];
		// 激活触摸事件
		self.isTouchEnabled = YES;
		[[[CCDirector sharedDirector]touchDispatcher]
		 addTargetedDelegate:self priority:0 swallowsTouches:YES];
		// 定时消息
		[self scheduleUpdate];
	}
	return self;
}


-(void) update:(ccTime)dt{
	// 如果怪物生命值为0
	if(self.monster.lifeValue <= 0){
		// 当前层删除玩家和怪物
		[self removeChild:self.monster cleanup:YES];
		[self removeChild:self.player cleanup:YES];
		// pop之前的游戏场景
		[[CCDirector sharedDirector] popScene];
	}
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	return YES;
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	// 将UI坐标转换为Node坐标
	CGPoint touchLocation = [touch locationInView: [touch view]];
	touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
	touchLocation = [self convertToNodeSpace:touchLocation];
	// 用CGRectContainsPoint判断触摸点是否在怪物精灵的boundingBox里
	if (CGRectContainsPoint(self.monster.boundingBox, touchLocation)) {
		// 回合制战斗模式，isShooting判断玩家是否可以射箭
		if (isShooting) {
			// 玩家向怪物射箭，射中怪物时用粒子效果做血花四溅效果
			[self shoot];
		}
	}
}

-(void) shoot{
	isShooting = NO;
	// 射箭动画
	CCAnimate *animAction = [self getAnimationByName:
		@"player_battle_" delay:1.5f animNum:5];
	id sequence = [CCSequence actions:animAction,[CCCallBlock actionWithBlock:^(){
		// 射箭动画完成后，在怪物身前播放血花四溅的粒子效果
		[self shootFinish];
		// 玩家攻击完成后，怪物开始攻击
		[self monsterAction];
	}], nil];
	[self.player runAction:sequence];
}

- (void) shootFinish {
	// 通过ParticleManager粒子管理类获得血花四溅的粒子对象
	CCParticleSystem *bloodSpurts = [[ParticleManager sharedParticleManager] particleWithType:bloodSpurts];
	// 设置粒子效果播放位置，即怪物面前
	[bloodSpurts setPosition:ccp(self.monster.position.x-5, self.monster.position.y)];
	// 添加粒子到当前层
	[self addChild:bloodSpurts];
	// 怪物减少生命值
	self.monster.lifeValue = self.monster.lifeValue - 7;
	// 血条减少
	if (self.monster.HP != nil) {
		self.monster.HP.percentage
		= self.monster.HPInterval * self.monster.lifeValue;
	}
	// 延迟2秒后删除粒子效果
	id remove = [CCSequence actions: [CCDelayTime actionWithDuration:2.0f],
				 [CCCallBlock actionWithBlock:^(){
		// 删除粒子效果
		[self removeChild:bloodSpurts cleanup:YES];
	}],nil];
	[self runAction:remove];
}

-(void)monsterAction{
	// 怪物战斗动画
	CCAnimate *animAction = [self getAnimationByName:@"eagle_battle_" delay:2.0f animNum:9];
	// 怪物发射魔法光波
	CCSprite *bullet = [CCSprite spriteWithFile:@"bullet.png"];
	bullet.rotation = 270;
	bullet.scale = 2;
	bullet.position = ccp(self.monster.position.x-20, self.monster.position.y-20);
	bullet.visible = NO;
	[self addChild:bullet];
	// 通过ParticleManager粒子管理类获得魔法光波粒子对象
	CCParticleSystem *magic = [[ParticleManager sharedParticleManager] particleWithType:magic];
	// 设置魔法粒子效果位置
	[magic setPosition:ccp(self.player.position.x-30, self.player.position.y+20)];
	// 创建魔法光波移动动作，移动位置（射向玩家）
	id moveTo = [CCMoveTo actionWithDuration:0.5
		position:ccp(self.player.position.x+10, self.player.position.y+7)];
	id sequence = [CCSequence actions:animAction,[CCCallBlock actionWithBlock:^(){
		// 怪物战斗动画播放完毕之后，设置魔法光波可见，并让魔法光波移动
		bullet.visible = YES;
		[bullet runAction:moveTo];
	}], nil];
	[self.monster runAction:sequence];
	// 魔法光波击中玩家后，播放魔法光波粒子效果
	id remove = [CCSequence actions:[CCDelayTime actionWithDuration:2.5f],
				 [CCCallBlock actionWithBlock:^(){
		// 停止魔法光波精灵多有动作并删除魔法光波精灵
		[bullet stopAllActions];
		[self removeChild:bullet cleanup:YES];
		// 播放魔法光波粒子效果
		[self addChild:magic];
	}], [CCDelayTime actionWithDuration:1.0f],
				 [CCCallBlock actionWithBlock:^(){
		// 删除魔法光波粒子效果
		[self removeChild:magic cleanup:YES];
		// 回合结束，玩家可以继续射箭了
		isShooting = YES;
	}],nil];
	[self.monster runAction:remove];
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



@end
