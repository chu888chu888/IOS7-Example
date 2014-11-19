

#import "CallFuncLayer.h"


#import "AppDelegate.h"

#pragma mark - CallFuncLayer

@implementation CallFuncLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	// 'layer' is an autorelease object.
	CallFuncLayer *layer = [CallFuncLayer node];
	// add layer as a child to scene
	[scene addChild: layer];
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
static NSInteger kTagPlane = 1;
-(id) init
{
	if( (self=[super init]) ) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		CCSprite* planeSprite = [CCSprite spriteWithFile:@"plane.png"];
		// 初始化在屏幕中间的最左边
		planeSprite.position = ccp(planeSprite.contentSize.width/2, winSize.height/2);
		// 添加到层当中，tag用于节点的标识，之后可以通过getChildByTag方法获取指定的节点对象
		[self addChild:planeSprite z:1 tag:kTagPlane];
		// 定义了一个CCCallFunc动作，调用move方法
		[planeSprite runAction:[CCCallFunc actionWithTarget:self selector:@selector(move)]];
	}
	return self;
}

-(void) move{
	CGSize winSize = [[CCDirector sharedDirector] winSize];
	// 通过标识值获得精灵对象
	CCSprite* sprite = (CCSprite*)[self getChildByTag:kTagPlane];
	// 定义一个CCMoveTo动作，精灵从屏幕左边移动到屏幕右边
	[sprite runAction:[CCMoveTo actionWithDuration:5
		position:ccp(winSize.width-sprite.contentSize.width/2, winSize.height/2)]];
}

@end
