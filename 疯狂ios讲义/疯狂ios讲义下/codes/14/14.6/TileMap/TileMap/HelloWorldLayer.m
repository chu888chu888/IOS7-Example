//
//  HelloWorldLayer.m
//  TileMap
//
//  Created by Jason on 13-9-27.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

@synthesize tileMap = _tileMap;
@synthesize player =_player;
NSInteger screenWidth , screenHeight;  // 屏幕的宽度和高度

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
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if(self = [super init]) {
		// 获得屏幕的大小，并给代表屏幕宽度和高度的两个变量赋值
		CGSize winSzie = [[CCDirector sharedDirector] winSize];
		screenWidth = winSzie.width;
		screenHeight = winSzie.height;
		// 调用CCTMXTiledMap的方法读取TileMap.tmx文件创建一个瓦片地图对象
		self.tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"TileMap.tmx"];
		// 把地图的锚点和位置都设置为原点，这样可以使地图的左下角与屏幕的左下角对齐
		self.tileMap.anchorPoint = CGPointZero;
		self.tileMap.position = CGPointZero;
		[self addChild:self.tileMap z:-1];
		// 调用CCTMXTiledMap的objectGroupNamed方法获取对象层
		CCTMXObjectGroup* objects = [self.tileMap objectGroupNamed:@"Objects"];
		// 调用CCTMXObjectGroup的objectNamed方法获取一个NSMutableDictionary对象
		NSMutableDictionary *objectPoint = [objects objectNamed:@"player"];
		// 获取对象的x和y值
		int x = [[objectPoint valueForKey:@"x"] intValue];
		int y = [[objectPoint valueForKey:@"y"] intValue];
		// 创建玩家精灵，并将地图中对象的x和y值作为玩家精灵对象出现的位置
		self.player = [CCSprite spriteWithFile:@"player.png"];
		self.player.position = ccp(x, y);
		[self.tileMap addChild:self.player];
		// 激活触摸事件
		[[[CCDirector sharedDirector]touchDispatcher]addTargetedDelegate:self
			priority:0 swallowsTouches:YES];
	}
	return self;
}

- (CGPoint)tileCoordForPosition:(CGPoint)position {
	int x = (int)(position.x / (self.tileMap.tileSize.width / CC_CONTENT_SCALE_FACTOR()));
	float pointHeight = self.tileMap.tileSize.height / CC_CONTENT_SCALE_FACTOR();
	int y = (int)((self.tileMap.mapSize.height * pointHeight - position.y) / pointHeight);
	return ccp(x, y);
}

// 让地图随玩家一起移动
-(void)setViewpointCenter:(CGPoint) position {
	// MAX和MIN分别返回两个传入参数的最大值和最小值
	int x = MAX(position.x, screenWidth / 2);
	int y = MAX(position.y, screenHeight / 2);
	// 不让地图移出屏幕
	x = MIN(x, (self.tileMap.mapSize.width * self.tileMap.tileSize.width
		- screenWidth) / 2);
	y = MIN(y, (self.tileMap.mapSize.height * self.tileMap.tileSize.height
		- screenHeight) / 2);
	CGPoint actualPosition = ccp(x, y);
	CGPoint centerOfView = ccp(screenWidth/2, screenHeight/2);
	// 计算中心位置和玩家位置两点之间的差异
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
	// 重新玩家位置
	self.player.position = touchLocation;
	// 调整视角中心位置让地图随玩家一起移动
	[self setViewpointCenter:self.player.position];
}

@end













