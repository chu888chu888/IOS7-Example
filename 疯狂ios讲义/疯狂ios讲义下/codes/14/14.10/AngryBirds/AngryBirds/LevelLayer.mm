//
//  LevelScene.m
//  AngryBirds
//
//

#import "LevelLayer.h"
#import "LevelUtils.h"
#import "StartLayer.h"
#import "GameLayer.h"
#import "HelloWorldLayer.h"

@implementation LevelLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	LevelLayer *layer = [LevelLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
		CGSize winSize = [CCDirector sharedDirector].winSize;
		// 背景图片
		CCSprite* selectlevel = [CCSprite spriteWithFile:@"selectlevel.png"];
		selectlevel.position = ccp(winSize.width/2, winSize.height/2);
		[self addChild:selectlevel];
		// 返回图片
		CCSprite* back = [CCSprite spriteWithFile:@"back.png"];
		back.position = ccp(40, 40);
		back.scale = 0.5f;
		// 设置tag用于标示
		back.tag = 100;
		[self addChild:back];
		
		// 读取关卡
		_successLevel = [LevelUtils readLevelFromFile];
		NSString* imagePath = nil;
		for(int i = 0;i<12;i++){
			if(i < _successLevel){
				// 已经通关
				imagePath = @"level.png";
				//加入通关卡数字
				NSString *str = [NSString stringWithFormat:@"%d",i+1];
				CCLabelTTF *num = [CCLabelTTF labelWithString:str
					dimensions:CGSizeMake(60, 60)
					hAlignment:kCCTextAlignmentCenter
					fontName:@"Marker Felt" fontSize:30];
				float x = 80+i%6*80;
				float y = 320-115-i/6*80;
				num.position = ccp(x, y);
				[self addChild:num z:2];
			}else{
				// 加锁的关卡
				imagePath = @"clock.png";
			}
			CCSprite* level = [CCSprite spriteWithFile:imagePath];
			// 设置tag,避免同名冲突
			level.tag = i+1;
			float x = 80+i%6*80;
			float y = 320-100-i/6*80;
			level.position = ccp(x, y);
			level.scale = 0.6f;
			[self addChild:level z:1];
		}
		
		[[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
		// 激活触摸事件
//		[[[CCDirector sharedDirector] touchDispatcher] 
//			addTargetedDelegate:self priority:0];
	}
	return self;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
	// 获得当前的UIView坐标
	CGPoint location = [touch locationInView:touch.view];
	// 转成世界坐标(OpenGL坐标)
	CGPoint gLPoint  = [[CCDirector sharedDirector] convertToGL:location];
	// 循环判断用户单击的是哪个图片按钮，进行相应的操作
	for(int i = 0 ;i < self.children.count;i++){
		// 获取self的每一个Child
		CCSprite* tempSprite = [self.children objectAtIndex:i];
		// CGRectContainsPoint方法判断第二个参数点是否在第一个矩形范围之内
		// tempSprite.tag == 100 判断是否返回按钮
		if(CGRectContainsPoint(tempSprite.boundingBox, gLPoint ) ){
			// 如果玩家点击返回按钮则返回到游戏开始场景
			if(tempSprite.tag == 100){
				CCScene *scene = [StartLayer scene];
				CCTransitionScene *transition = [[CCTransitionSplitRows alloc] 
					initWithDuration:2.0f scene:scene];
				[[CCDirector sharedDirector] replaceScene:transition];
			}
			// 如果玩家选择的是已开放的关卡，进入游戏主场景
			else if((tempSprite.tag  < _successLevel + 1) && (tempSprite.tag > 0)){
				// 删除当前的触摸事件监听
				[[[CCDirector sharedDirector] touchDispatcher] removeDelegate:self];
				CCScene *scene = [GameLayer sceneWithLevel:tempSprite.tag];
				CCTransitionScene *transition = [[CCTransitionSplitRows alloc]
					initWithDuration:2.0f scene:scene];
				[[CCDirector sharedDirector] replaceScene:transition];
			}
			else if (tempSprite.tag !=-1){
				// 如果玩家选择的是未开放的关卡，弹出提示信息
				NSString *message = [NSString stringWithFormat:@"第%d关暂时未开放"
					,tempSprite.tag];
				UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示"
					message:message delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil];
				[alter show];
			}
			
		}
	}
	return YES;
}


@end
