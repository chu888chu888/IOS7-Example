//
//  PreloadLayer.m
//  AngryBirds
//
//

#import "PreloadLayer.h"
#import "HelloWorldLayer.h"
#import "StartLayer.h"


@interface PreloadLayer()
-(void) loadingComplete;  // 资源全部加载完成，切换到另一个游戏场景
-(void) load: (ccTime) dt;  // 更新游戏进度条，计算何时加载完成
@end;

@implementation PreloadLayer

CCProgressTimer* progress;  // 显示进度条的变量
float progressInterval;  // 代表进度条更新次数
int sourceCount;  // 用来保存游戏需要加载的资源总数

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	PreloadLayer *layer = [PreloadLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
		
		CGSize winSize = [CCDirector sharedDirector].winSize;
		
		// 预加载资源时显示的图片资源
		CCSprite* loading = [CCSprite spriteWithFile:@"loading.png"];
		loading.position = ccp(winSize.width/2, winSize.height/2);
		[self addChild:loading];
		
		// 创建一个进度条精灵
		CCSprite* barSprite = [CCSprite spriteWithFile:@"progressbar.png"];
		// 初始一个CCProgressTimer进度条对象
		progress = [CCProgressTimer progressWithSprite:barSprite];
		// setPercentage:0.0f，表示并未加载任何资源，表现在屏幕上就是什么也看不见
		[progress setPercentage:0.0f];
		// 由于图片大小关系,把scale设置成0.5,即缩小一半
		progress.scale = 0.5;
		// 进度条动画的起始位置,默认在图片的中点，
		// 如果想要显示从左到右的一个动画效果,必须改成(0,y)
		progress.midpoint = ccp(0, 0.5);
		// barChangeRate表示是否改变水平或者垂直方向的比例，设置成1表示改变，0表示不改变.
		progress.barChangeRate = ccp(1, 0);
		// kCCProgressTimerTypeBar表示为条形进度条
		progress.type = kCCProgressTimerTypeBar;
		// 设置position位置
		[progress setPosition:ccp(winSize.width/2-50, 10)];
		// 将进度条添加为当前层的子节点
		[self addChild:progress];

		// 模拟需要加载的资源文件
		sourceCount = 2;
		// 设置进度条更新次数=100/需要加载的资源数量
		progressInterval = 100.0 / (float) sourceCount;
		
		[self schedule:@selector(load:) interval:2.0f];
	}
	return self;
}

-(void) load: (ccTime) dt{
	// 每次调用该方法说明加载一个资源,自减更新资源总数
	if (sourceCount--) {
		[progress setPercentage:100.0f-(progressInterval * sourceCount)];
	}else{
		// CCProgressFromTo动作用于以渐进的方式显示图片。
		// actionWithDuration表示持续0.5秒 from表示进度条百分百从开始一直到100
		CCProgressFromTo *ac = [CCProgressFromTo actionWithDuration:0.5
															   from:progress.percentage to:100];
		// 当资源全部加载完毕时调用loadingComplete方法
		CCCallBlock *callback = [CCCallBlock actionWithBlock:^() {
			[self loadingComplete];
			CCLOG(@"所有资源加载完成");
		}];
		// CCSequence组合动作
		id action = [CCSequence actions:ac,callback, nil];
		// 进度条执行动作
		[progress runAction:action];
	}

}

//延迟两秒之后运行一个场景切换特效跳转到游戏主场景，即StartLayer
- (void) loadingComplete{
	[self unscheduleAllSelectors];
	CCScene* scene = [StartLayer scene];
	[[CCDirector sharedDirector] replaceScene:scene];
}
@end
