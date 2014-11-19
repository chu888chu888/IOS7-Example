


// Import the interfaces
#import "CallBlockLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - CallBlockLayer

// CallBlockLayer implementation
@implementation CallBlockLayer

// Helper class method that creates a Scene with the CallBlockLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	CallBlockLayer *layer = [CallBlockLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	if( (self=[super init]) ) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		CCSprite* planeSprite = [CCSprite spriteWithFile:@"plane.png"];
		// 初始化在屏幕中间的最左边
		planeSprite.position = ccp(planeSprite.contentSize.width/2, winSize.height/2);
		// 添加到层当中，tag用于节点的标识，之后可通过getChildByTag方法获取指定的节点对象
		[self addChild:planeSprite];
		// 定义了一个CCCallBlock动作,在Block中让飞机精灵移动
		[planeSprite runAction:[CCCallBlock actionWithBlock:^{
			// 定义一个CCMoveTo动作，精灵从屏幕左边移动到屏幕右边
			[planeSprite runAction:[CCMoveTo actionWithDuration:5
				position:ccp(winSize.width-planeSprite.contentSize.width/2, winSize.height/2)]];
		}]];
	}
	return self;
}
@end







