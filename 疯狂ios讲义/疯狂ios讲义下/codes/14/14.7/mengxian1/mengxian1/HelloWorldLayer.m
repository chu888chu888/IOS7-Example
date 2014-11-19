//
//  HelloWorldLayer.m
//  Test2
//
//  Created by Jason on 13-10-22.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
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
CCTMXLayer *collidable;  // 障碍层
NSInteger screenWidth , screenHeight;  // 屏幕宽度和高度
NSInteger count;  // 游戏帧计数器
BOOL isFull;  // 怪物数组是否到达上限

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
		// 玩家X轴镜像反转
		self.player = [CCSprite spriteWithFile:@"player_stand_1.png"];
		self.player.flipX = YES;
		self.player.position = ccp(50, screenHeight/2+120);
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
	// 调用玩家精灵移动方法
	[self setPlayerPosition:touchLocation];
	// 调用地图移动方法
	[self setViewpointCenter:self.player.position];
}

-(void)setPlayerPosition:(CGPoint)position {
	// 将玩家精灵的坐标从左下角原点的坐标系转换为左上角原点的坐标系（TileMap坐标系）。
	CGPoint tileCoord = [self tileCoordForPosition:position];
	// 使角色移动时被物体遮住
	[self updateVertexZ:tileCoord tileMap:self.tileMap];
	// 使用里的tileGIDAt函数获取TileMap坐标系里的GID。GID是“全局唯一标识”
	int tileGid = [collidable tileGIDAt:tileCoord];
	if (tileGid) {
		// 使用GID来查找指定tile的属性的时候。返回一个属性字典
		NSDictionary *properties = [self.tileMap propertiesForGID:tileGid];
		// 遍历字典，判断是否有”可碰撞的“物体，如果有，直接返回
		if (properties) {
			NSString *collision = [properties valueForKey:@"collidable"];
			if (collision && [collision compare:@"true"] == NSOrderedSame) {
				return;
			}
		}
	}
	// 玩家精灵移动到指定位置
	[self playerMove:position];
}

// 根据玩家移动距离计算移动时间方法
-(float) getPlayerMoveTime:(CGPoint) start end:(CGPoint) end{
	// 将起点和终点的cocos2d坐标转换为TileMap坐标
	CGPoint tileStart = [self tileCoordForPosition:start];
	CGPoint tileEnd = [self tileCoordForPosition:end];
	// 移动一个网格的时间
	float duration = 0.4f;
	// 根据移动网格计算移动时间
	duration = duration * sqrtf((tileStart.x - tileEnd.x) * (tileStart.x - tileEnd.x)
		+ (tileStart.y - tileEnd.y) * (tileStart.y - tileEnd.y));
	return duration;
}

-(void)playerMove:(CGPoint)position{
	CCAnimate *animAction = [self getAnimationByName:@"player_move_" delay:1.5f animNum:4];
	// 定义一个动作，重复执行CCAnimate动画
	id repeatanimAction = [CCRepeatForever actionWithAction:animAction];
	// 获得玩家移动的时间
	float duration = [self getPlayerMoveTime:self.player.position end:position];
	// 定义一个动作，让精灵对象移动到特定的位置
	id moveTo = [CCMoveTo actionWithDuration:duration position:position];
	// 精灵重复执行动画动作和移动动作
	[self.player runAction:repeatanimAction];
	id sequence = [CCSequence actions:moveTo,[CCCallBlock actionWithBlock:^(){
		// 停止动画
		[self.player stopAction:repeatanimAction];
		CCTexture2D *spriteTexture = [[CCTextureCache sharedTextureCache]
		addImage:@"player_stand_1.png"];
		[self.player setTexture:spriteTexture];
	}], nil];
	[self.player runAction:sequence];
}

-(CCAnimate*)getAnimationByName:(NSString *)animName delay:(float)delay animNum:(int)num{
	CCAnimation* anim = [CCAnimation animation];
	for (int i = 1; i <= num; i++) {
		NSString *fileName = [NSString stringWithFormat:@"%@%d.png",animName,i];
		[anim addSpriteFrameWithFilename:fileName];
	}
	// 创建animAction动画，restoreOriginalFrame:YES
	// 可以让精灵对象在动画执行完后恢复到最初状态
	CCAnimate *animAction = [CCAnimate actionWithDuration:delay 
	animation:anim restoreOriginalFrame:YES];
	return animAction;
}

// 将cocos2d坐标转换为TileMap坐标
- (CGPoint)tileCoordForPosition:(CGPoint)position {
	// CC_CONTENT_SCALE_FACTOR Retina返回2，否则返回1
	// 玩家位置的x除以地图的宽，得到的是地图横向的第几个格子（tile）
	int x = (int)(position.x / (self.tileMap.tileSize.width / CC_CONTENT_SCALE_FACTOR()));
	// 玩家位置的y除以地图的高，得到的是地图纵向第几个格子（tile），
	// 但是因为cocos2d的y轴和TileMap的y轴相反，所以使用地图的高度减去玩家位置的y
	float pointHeight = self.tileMap.tileSize.height / CC_CONTENT_SCALE_FACTOR();
	int y = (int)((self.tileMap.mapSize.height * pointHeight - position.y) / pointHeight);
	return ccp(x, y);
}

// 修改vertexZ值
-(void) updateVertexZ:(CGPoint) tilePos tileMap:(CCTMXTiledMap*)tileMap{
	// 最小的vertexZ值，就是地图的高度和宽度的和的负数
	float lowestZ = -(tileMap.mapSize.width + tileMap.mapSize.height);
	// 当前瓦片的坐标与最小的vertexZ坐标（点(0,0)）之间的差值就是该点的x轴和y轴坐标之和。
	float currentZ = tilePos.x + tilePos.y;
	// 最小的vertexZ值 + 当前瓦片的坐标与最小的vertexZ之间的差值 = 当前瓦片坐标的vertexZ值
	self.player.vertexZ = lowestZ + currentZ -2.0f;
}

-(void) update: (ccTime)dt{

}
@end
