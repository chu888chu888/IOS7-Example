//
//  PreloadLayer.m
//  Airfight
//
//  Created by Jason on 13-9-13.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "PreloadLayer.h"
#import "HelloWorldLayer.h"
#import "SimpleAudioEngine.h"

/**
 定义一个私有的Category，为了不让API暴露给客户端，
 将一些类的内部使用哪个的方法和变量放在私有的扩展里面，而不是直接声明在头文件当中.
 */
@interface PreloadLayer ()
- (void) loadMusics:(NSArray *) musicFiles;  // 加载背景音乐
- (void) loadSounds:(NSArray *) soundClips;  // 加载游戏音效
- (void) loadSpriteSheets:(NSArray *) spriteSheets;  // 加载精灵表单
- (void) loadingComplete;  // 资源全部加载完成，切换到另一个游戏场景
- (void) progressUpdate;  // 更新游戏进度条，计算何时加载完成
@end;

@implementation PreloadLayer

// 用来保存游戏需要加载的资源总数
int sourceCount;
// 显示进度条的成员变量
CCProgressTimer* progress;
// 代表进度条更新的次数
float progressInterval;

+ (CCScene *) scene
{
	CCScene* scene = [CCScene node];
	PreloadLayer* layer = [PreloadLayer node];
	[scene addChild:layer];
	return scene;
}
- (id) init{
	if((self = [super init])){
		// 获取屏幕大小
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		// 创建一个进度条精灵
		CCSprite* barSprite = [CCSprite spriteWithFile:@"progressbar.png"];
		// 初始一个CCProgressTimer进度条对象
		progress = [CCProgressTimer progressWithSprite:barSprite];
		// setPercentage:0.0f,表示并未加载任何资源,表现在屏幕上就是什么也看不见
		[progress setPercentage:0.0f];
		//由于图片大小关系,把scale设置成0.5,即缩小一半
		progress.scale = 0.5;
		// 进度条动画的起始位置,默认在图片的中点，
		// 如果想要显示从左到右的一个动画效果，必须改成(0,y)
		progress.midpoint = ccp(0, 0.5);
		// barChangeRate表示是否改变水平或者垂直方向的比例,设置成1表示改变,0表示不改变.
		progress.barChangeRate = ccp(1, 0);
		// 本例制作一个从左至右的水平进度条,所以midpoint应该是(0,0.5)，
		// 因为x方向需要改变而y不需要,所以barChangeRate = ccp(1, 0)
		// kCCProgressTimerTypeBar表示为条形进度条
		progress.type = kCCProgressTimerTypeBar;
		// 设置position在中心点
		[progress setPosition:ccp(winSize.width/2, winSize.height/2)];
		// 将进度条添加为当前层的子节点
		[self addChild:progress];
	}
	return self;
}
- (void) onEnterTransitionDidFinish{
	[super onEnterTransitionDidFinish];
	//加载preloadResources.plist配置文件
	NSString* path = [[CCFileUtils sharedFileUtils] 
	fullPathFromRelativePath:@"preloadResources.plist"];
	// 读取配置文件中的游戏资源名称列表返回一个NSDictionary对象,
	NSDictionary* resources = [NSDictionary dictionaryWithContentsOfFile:path];
	// 通过key值取出每种不同类型资源的数组
	NSArray *spriteSheets = [resources objectForKey:@"SpriteSheets"];
	NSArray *sounds = [resources objectForKey:@"Sounds"];
	NSArray *musics = [resources objectForKey:@"Musics"];
	// 调用数组的count方法得到总共需要加载的资源数量
	sourceCount = [spriteSheets count]  + [sounds count] + [musics count];
	// 设置进度条更新次数=100/需要加载的资源数量
	progressInterval = 100.0 / (float) sourceCount;
	// 调用performSelectorOnMainThread在主线程上依次加载每种类型的游戏资源
	// waitUntilDone的值为YES能保证所有的资源按照序列依次加载
	if(sounds){
		[self performSelectorOnMainThread:@selector(loadSounds:) 
		withObject:sounds waitUntilDone:YES];
	}
	if(spriteSheets){
		[self performSelectorOnMainThread:@selector(loadSpriteSheets:)
		withObject:spriteSheets waitUntilDone:YES];
	}
	if(musics){
		[self performSelectorOnMainThread:@selector(loadMusics:) 
		withObject:musics waitUntilDone:YES];
	}
}
// 加载背景音乐
- (void) loadMusics:(NSArray *)musicFiles{
	for (NSString *music  in  musicFiles) {
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:music];
		[self progressUpdate];
	}
}
// 加载声音
- (void) loadSounds:(NSArray *)soundClips{
	for (NSString *soundClip in soundClips) {
		[[SimpleAudioEngine sharedEngine] preloadEffect:soundClip];
		[self progressUpdate];
	}
}
// 加载精灵表单
- (void) loadSpriteSheets:(NSArray *)spriteSheets{
	for (NSString *spriteSheet in spriteSheets) {
		// 该方法会加载与该plist文件名称相同但后缀为.png的纹理图片，
		// 把该plist的所有spriteFrame信息读取出来
		// 在之后的代码中可以通过spriteFrameWithName获取相应的精灵帧
		// 本例中airfightSheet.plist对应airfightSheet.png
		[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:spriteSheet];
		[self progressUpdate];
	}
}
- (void) progressUpdate{
	// 每次调用该方法说明加载一个资源,自减更新资源总数
	if (--sourceCount) {
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
// 延迟两秒之后运行一个场景切换特效跳转到游戏主场景,即HelloWorldLayer
- (void) loadingComplete{
	CCDelayTime *delay = [CCDelayTime actionWithDuration:2.0f];
	CCCallBlock *callblock = [CCCallBlock actionWithBlock:^(void) {
		[[CCDirector sharedDirector] replaceScene:
		[CCTransitionFade transitionWithDuration:1.0f scene:[HelloWorldLayer scene]]];
	}];
	CCSequence *sequence = [CCSequence actions:delay,callblock, nil];
	[self runAction:sequence];
}
@end
