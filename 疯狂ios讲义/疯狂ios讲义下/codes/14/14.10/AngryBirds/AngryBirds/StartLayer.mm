//
//  StartScene.m
//  AngryBirds
//
//

#import "StartLayer.h"
#import "LevelLayer.h"
#import "ParticleManager.h"

@interface StartLayer ()
// 创建一个跳跃的小鸟
-(void)createJumpBird;
// 小鸟完成动作后产生爆破粒子效果
-(void) birdExplosition:(id)sender;
// 开始游戏
-(void) startGame:(id) sender;
@end

@implementation StartLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	StartLayer *layer = [StartLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
		
		CGSize winSize = [CCDirector sharedDirector].winSize;

		// 添加开始场景的背景
		CCSprite* startbg = [CCSprite spriteWithFile:@"startbg.png"];
		startbg.position = ccp(winSize.width/2, winSize.height/2);
		[self addChild:startbg];
		
		// 添加愤怒的小鸟文字Logo
		CCSprite* angrybird = [CCSprite spriteWithFile:@"angrybird.png"];
		angrybird.position = ccp(300, 250);
		[self addChild:angrybird];
		
		// 添加start按钮
		CCSprite *start = [CCSprite spriteWithFile:@"start.png"];
		CCMenuItemSprite *startMenuItem = [CCMenuItemSprite itemWithNormalSprite:start
			selectedSprite:nil target:self selector:@selector(startGame:)];
		CCMenu *menu = [CCMenu menuWithItems:startMenuItem, nil];
		menu.position = ccp(winSize.width/2, winSize.height/2);
		[self addChild:menu];
		
		// 获取雪花的粒子效果对象
		CCParticleSystem *particleSnow = [[ParticleManager sharedParticleManager] particleWithType:snow];
		// 添加雪花的粒子效果
		[self addChild:particleSnow];
		
		// 设计一个定时器，每隔1秒执行birdJump方法
		[self schedule:@selector(birdJump:) interval:1.0f];
	}
	return self;
}

- (void) birdJump:(ccTime) dt {
	[self createJumpBird];
}

- (void) createJumpBird {
	// 创建一个小鸟精灵
	CCSprite *bird = [CCSprite spriteWithFile:@"bird1.png"];
	// 给小鸟设置一个缩放比例
	bird.scale = (arc4random()%5)/10.0f;
	// 给小鸟设置一个坐标位置
	bird.position = ccp(50.0f+arc4random()%50, 70.0f);
	// 设置一个终点坐标位置
	CGPoint endPoint = ccp(420.0f+arc4random()%50, 65.0f);
	// 设置一个高度
	CGFloat height = arc4random()%100+50.0f;
	// 创建一个Jump动作，动作执行时间是2秒，最终位置是endPoint，最大高度是height
	CCJumpTo *actionJump = [CCJumpTo actionWithDuration:2.0f
		position:endPoint height:height jumps:1];
	// Jump动作完成后执行birdExplosition方法
	CCCallFuncN *callFuncN = [CCCallFuncN actionWithTarget:self
		selector:@selector(birdExplosition:)];
	// 定义了一个Sequence的动作 首先执行Jump 然后执行CallFuncN动作
	CCSequence *allActions = [CCSequence actions:actionJump,callFuncN, nil];
	// 让bird执行一个动作
	[bird runAction:allActions];
	// 将bird添加到当前层
	[self addChild:bird];
}

- (void) birdExplosition:(id)sender {
	//参数sender就是调用动作的节点对象
	CCNode *node = (CCNode*)sender;
	// 获取爆破效果的粒子对象
	CCParticleSystem *particleExplosition = [[ParticleManager sharedParticleManager]
		particleWithType:explosition];
	// 把node和粒子效果对象位置保持一样，也就是让粒子效果在小鸟完成jump的位置产生
	[particleExplosition setPosition:[node position]];
	// 将粒子效果添加到当前层
	[self addChild:particleExplosition];
	// 从屏幕上删除这个node（即小鸟精灵）
	[self removeChild:node cleanup:YES];
}

-(void) startGame:(id) sender{
	// 创建LevelLayer场景
	CCScene* scene = [LevelLayer scene];
	// CCTransitionSplitRows 横向剧场动画
	CCTransitionScene *transition = [[CCTransitionSplitRows alloc] 
		initWithDuration:2.0f scene:scene];
	// 切换到选关场景
	[[CCDirector sharedDirector] replaceScene:transition];
}

@end
