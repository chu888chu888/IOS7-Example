//
//  FKViewController.m
//  airfight
//
//  Created by yeeku on 13-9-11.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import "FKViewController.h"
#import "FKBlast.h"

// 定义背景图片的高度为860
#define BACK_HEIGHT 860
@implementation FKViewController
NSTimer* timer;
CALayer* bgLayer1;
CALayer* bgLayer2;
CALayer* myPlane;
CATextLayer* scoreLayer;
NSMutableArray* ePlaneArray;
NSMutableArray* bulletArray;
NSMutableArray* blastArray;
AVAudioPlayer* bgMusicPlayer;
SystemSoundID blastSound;
NSInteger count;
NSMutableArray* blastImageArray;
UIImage* planeImage0;
UIImage* planeImage1;
UIImage* ePlaneImage0;
UIImage* ePlaneImage1;
UIImage* ePlaneImage2;
UIImage* bulletImage;
UIImage* bgImage;
NSInteger score;
// 定义获取屏幕宽度、高度的变量
NSInteger screenWidth , screenHeight;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 获取屏幕的宽度和高度
	CGRect screenBounds = [UIScreen mainScreen].bounds;
	screenWidth = screenBounds.size.width;
	screenHeight = screenBounds.size.height;
	blastImageArray = [NSMutableArray arrayWithObjects:
		[UIImage imageNamed:@"blast0"],
		[UIImage imageNamed:@"blast1"],
		[UIImage imageNamed:@"blast2"],
		[UIImage imageNamed:@"blast3"],
		[UIImage imageNamed:@"blast4"],
		[UIImage imageNamed:@"blast5"],nil];
	// 初始化显示自己的飞机动画所需的2张图片
	planeImage0 = [UIImage imageNamed:@"plane0"];
	planeImage1 = [UIImage imageNamed:@"plane1"];
	// 初始化3种敌机的图片
	ePlaneImage0 = [UIImage imageNamed:@"e0"];
	ePlaneImage1 = [UIImage imageNamed:@"e1"];
	ePlaneImage2 = [UIImage imageNamed:@"e2"];
	// 初始化子弹的图片
	bulletImage = [UIImage imageNamed:@"bullet"];
	// 初始化背景图片
	bgImage = [UIImage imageNamed:@"bg.jpg"];
	// 获取背景音效的音频文件的URL
	NSURL* bgMusicURL = [[NSBundle mainBundle]
		URLForResource:@"s3" withExtension:@"wav"];
	// 创建AVAudioPlayer对象
	bgMusicPlayer = [[AVAudioPlayer alloc]
		initWithContentsOfURL:bgMusicURL error: nil];
	bgMusicPlayer.numberOfLoops = -1;
	// 播放背景音效
	[bgMusicPlayer play];
	// 获取要播放的音频文件的URL
	NSURL* blastSoundURL = [[NSBundle mainBundle]
		URLForResource:@"b0" withExtension:@"mp3"];
	// 加载音效文件
	AudioServicesCreateSystemSoundID((__bridge CFURLRef)blastSoundURL, &blastSound);
	// 初始化容纳所有敌机、所有子弹、所有爆炸效果的NSMutableArray集合
	ePlaneArray = [[NSMutableArray alloc] init];
	bulletArray = [[NSMutableArray alloc] init];
	blastArray = [[NSMutableArray alloc] init];
	// 创建代表背景CALayer对象
	bgLayer1 = [CALayer layer];
	// 设置该bgLayer1.contents显示的图片
	bgLayer1.contents = (id)[bgImage CGImage];
	bgLayer1.frame = CGRectMake(0 , screenHeight - BACK_HEIGHT
		, screenWidth ,BACK_HEIGHT);
	[self.view.layer addSublayer:bgLayer1];
	// 创建代表背景CALayer对象
	bgLayer2 = [CALayer layer];
	// 设置该bgLayer2.contents显示的图片
	bgLayer2.contents = (id)[bgImage CGImage];
	bgLayer2.frame = CGRectMake(0 , screenHeight - BACK_HEIGHT * 2
		, screenWidth ,BACK_HEIGHT);
	[self.view.layer addSublayer:bgLayer2];
	// 创建代表自己的飞机CALayer对象
	myPlane = [CALayer layer];
	myPlane.frame = CGRectMake((screenWidth - 56 )/ 2
		, screenHeight - 80 , 56 , 61);
	[self.view.layer addSublayer:myPlane];
	// 创建显示积分的CALayer
	scoreLayer = [CATextLayer layer];
	scoreLayer.frame = CGRectMake(10 , 10 , 120, 30);
	scoreLayer.fontSize = 16;
	// 使用NSUserDefaults读取系统已经保存的积分
	NSNumber* scoreNumber;
	if((scoreNumber = [[NSUserDefaults standardUserDefaults]
					   objectForKey:@"score"]))
	{
		score = scoreNumber.integerValue;
	}
	scoreLayer.string = [NSString stringWithFormat:@"累计积分：%d", score];
	[self.view.layer addSublayer:scoreLayer];
	// 启动定时器
	timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self
		selector:@selector(move) userInfo:nil repeats:YES];
	// 使用默认通知中心监听应用转入前台的过程
	// 应用转入前台时会向通知中心发送UIApplicationWillEnterForegroundNotification
	// 从而激发enterFore:方法
	[[NSNotificationCenter defaultCenter] addObserver:self
		selector:@selector(enterFore:)
		name:UIApplicationWillEnterForegroundNotification
		object:[UIApplication sharedApplication]];
	// 使用默认通知中心监听应用转入后台的过程
	// 应用转入后台时会向通知中心发送UIApplicationDidEnterBackgroundNotification
	// 从而激发enterBack:方法
	[[NSNotificationCenter defaultCenter] addObserver:self
		selector:@selector(enterBack:)
		name:UIApplicationDidEnterBackgroundNotification
		object:[UIApplication sharedApplication]];
}
- (void)move
{
	// 控制飞机的图片交替显示，实现动画效果
	myPlane.contents = (id)((count % 2 == 0) ? [planeImage0 CGImage] :
		[planeImage1 CGImage]);
	// 控制背景向下移动
	bgLayer1.frame = CGRectOffset(bgLayer1.frame , 0 , 5);
	bgLayer2.frame = CGRectOffset(bgLayer2.frame , 0 , 5);
	// 如果bgLayer1已经到了最下面（移出屏幕外），将bgLayer1移动到最上面
	if(bgLayer1.position.y == BACK_HEIGHT / 2 + screenHeight + 20)
	{
		[bgLayer1 removeFromSuperlayer];
		bgLayer1.position = CGPointMake(screenWidth / 2
			, screenHeight - BACK_HEIGHT * 3 / 2 + 20);
		[self.view.layer insertSublayer:bgLayer1 below:bgLayer2];
	}
	// 如果bgLayer2已经到了最下面（移出屏幕外），将bgLayer2移动到最上面	
	if(bgLayer2.position.y == BACK_HEIGHT / 2 + screenHeight + 20)
	{
		[bgLayer2 removeFromSuperlayer];
		bgLayer2.position = CGPointMake(screenWidth / 2
			, screenHeight - BACK_HEIGHT * 3 / 2 + 20);
		[self.view.layer insertSublayer:bgLayer2 below:bgLayer1];
	}
	// 遍历所有的爆炸效果
	for(int i= 0 ; i < blastArray.count ; i++)
	{
		FKBlast* blast = [blastArray objectAtIndex:i];
		// 控制爆炸效果CALayer显示下一张图片，从而显示爆炸动画
		blast.imageIndex = (blast.imageIndex + 1) % blastImageArray.count;
		blast.layer.contents = (id)[[blastImageArray
			objectAtIndex:blast.imageIndex] CGImage];
	}
	// 遍历所有的子弹
	for(int i= 0 ; i < bulletArray.count ; i++)
	{
		CALayer* bullet = [bulletArray objectAtIndex:i];
		// 控制所有子弹向上移动
		bullet.frame = CGRectOffset(bullet.frame, 0 , -15);
		// 如果子弹已经移出屏幕外，删除子弹
		if (bullet.position.y < -10)
		{
			// 删除该子弹CALayer
			[bullet removeFromSuperlayer];
			// 从bulletArray集合中删除子弹CALayer
			[bulletArray removeObject:bullet];
		}
	}
	// 遍历所有的敌机
	for(int i= 0 ; i < ePlaneArray.count ; i++)
	{
		CALayer* ePlane = [ePlaneArray objectAtIndex:i];
		// 控制所有敌机向下移动
		ePlane.frame = CGRectOffset(ePlane.frame, 0 , 15);
		// 如果敌机已经移出屏幕外，删除敌机
		if (ePlane.position.y > screenHeight + 50)
		{
			// 删除该敌机CALayer
			[ePlane removeFromSuperlayer];
			// 从ePlaneArray集合中删除敌机CALayer
			[ePlaneArray removeObject:ePlane];
		}
	}
	// 遍历所有子弹
	for(int i = 0 ; i < bulletArray.count ; i++)
	{
		// 处理第i颗子弹
		CALayer* bullet = [bulletArray objectAtIndex:i];
		CGPoint bulletPos = [bullet position];
		// 遍历所有敌机
		for (int j = 0 ; j < ePlaneArray.count; j++)
		{
			CALayer* ePlane = [ePlaneArray objectAtIndex:j];
			CGPoint ePlanePos = [ePlane position];
			// 如果敌机与子弹发生了碰撞
			if(CGRectContainsPoint(ePlane.frame, bulletPos))
			{
				// 创建CALayer来显示爆炸效果
				CALayer* blastLayer = [CALayer layer];
				// 设置显示爆炸效果的CALayer的大小和位置
				blastLayer.frame = CGRectMake(ePlanePos.x - 40
					, ePlanePos.y - 20, 78 , 72);
				// 设置爆炸效果CALayer显示的第一张图片
				blastLayer.contents = (id)[[blastImageArray objectAtIndex:0] CGImage];
				[self.view.layer addSublayer:blastLayer];
				// 以显示爆炸效果的CALayer、正在显示的图片索引创建FKBlast对象
				FKBlast* blast = [[FKBlast alloc] initWithLayer:blastLayer imageIndex:0];
				[blastArray addObject:blast];
				// 播放爆炸音效
				AudioServicesPlaySystemSound(blastSound);
				// 控制0.6秒后删除该爆炸效果
				[self performSelector:@selector(removeBlast:)
						   withObject:blast afterDelay:0.6];
				// 删除这颗子弹
				[bulletArray removeObject:bullet];
				[bullet removeFromSuperlayer];
				// 删除这架敌机
				[ePlaneArray removeObject:ePlane];
				[ePlane removeFromSuperlayer];
				// 积分加10
				score += 10;
				// 显示最新的积分
				scoreLayer.string = [NSString
					stringWithFormat:@"累计积分：%d", score];
				// 跳出循环，重新判断下一颗子弹
				break;
			}
		}
	}
	count++;
	// 控制count为5的倍数时发射一颗子弹
	if(count % 5 == 0)
	{
		// 创建代表子弹的CALayer
		CALayer* bulletLayer = [CALayer layer];
		bulletLayer.frame = CGRectMake(myPlane.position.x - 12
			, myPlane.position.y - 50 , 25 , 25);
		// 设置子弹图片
		bulletLayer.contents = (id)[bulletImage CGImage];
		[self.view.layer addSublayer:bulletLayer];
		[bulletArray addObject:bulletLayer];
	}
	// 控制count为10的倍数时添加一架敌机
	if (count % 10 == 0)
	{
		// 创建代表敌机的CALayer
		CALayer* eLayer = [CALayer layer];
		// 根据rand随机数添加不同的敌机
		int rand = arc4random() % 3;
		// 使用随机数来设置敌机的X坐标
		int randX = arc4random() % (screenWidth - 40) + 20;
		switch(rand)
		{
			case 0:
				// 设置第一种敌机所使用的图片
				eLayer.contents = (id)[ePlaneImage0 CGImage];
				eLayer.frame = CGRectMake(randX , -80 , 65 , 75);
				break;
			case 1:
				// 设置第二种敌机所使用的图片
				eLayer.contents = (id)[ePlaneImage1 CGImage];
				eLayer.frame = CGRectMake(randX , -80 , 88 , 65);
				break;
			case 2:
				// 设置第三种敌机所使用的图片
				eLayer.contents = (id)[ePlaneImage2 CGImage];
				eLayer.frame = CGRectMake(randX , -80 , 66 , 59);
				break;
		}
		[ePlaneArray addObject:eLayer];
		[self.view.layer addSublayer:eLayer];
	}
}
// 重写该方法，控制手指移动时，飞机跟随手指的移动
- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent *)event
{
	// 获取触碰点的坐标
	UITouch* touch = [touches anyObject];
	CGPoint touchPt = [touch locationInView:self.view];
	// 将飞机的X坐标移动到与手指触碰点的X坐标相同
	myPlane.position = CGPointMake(touchPt.x , myPlane.position.y);
}
// 控制删除爆照动画CALayer的方法
- (void) removeBlast:(FKBlast*)blast
{
	[blastArray removeObject:blast.layer];
	[blast.layer removeFromSuperlayer];
}
- (void) enterFore:(NSNotification*) notification
{
	NSLog(@"---enterFore---");
	// 初始化显示自己的飞机动画所需的2张图片
	planeImage0 = [UIImage imageNamed:@"plane0"];
	planeImage1 = [UIImage imageNamed:@"plane1"];
	// 初始化3种敌机的图片
	ePlaneImage0 = [UIImage imageNamed:@"e0"];
	ePlaneImage1 = [UIImage imageNamed:@"e1"];
	ePlaneImage2 = [UIImage imageNamed:@"e2"];
	// 初始化子弹的图片
	bulletImage = [UIImage imageNamed:@"bullet"];
	// 初始化背景图片
	bgImage = [UIImage imageNamed:@"bg.jpg"];
	bgLayer1.contents = (id)[bgImage CGImage];
	bgLayer2.contents = (id)[bgImage CGImage];
	// 获取背景音效的音频文件的URL
	NSURL* bgMusicURL = [[NSBundle mainBundle]
		URLForResource:@"s3" withExtension:@"wav"];
	// 创建AVAudioPlayer对象
	bgMusicPlayer = [[AVAudioPlayer alloc]
		initWithContentsOfURL:bgMusicURL error: nil];
	bgMusicPlayer.numberOfLoops = -1;
	// 播放背景音效
	[bgMusicPlayer play];
	// 使用NSUserDefaults读取系统已经保存的积分
	NSNumber* scoreNumber;
	if((scoreNumber = [[NSUserDefaults standardUserDefaults]
		objectForKey:@"score"]))
	{
		score = scoreNumber.integerValue;
	}
}
- (void) enterBack:(NSNotification*) notification
{
	NSLog(@"---enterBack---");
	// 转入后台时候将可以迅速重建、而且占用内存较大的对象设为nil，以便系统释放内存
	planeImage0 = nil;
	planeImage1 = nil;
	myPlane.contents = nil;	
	ePlaneImage0 = nil;
	ePlaneImage1 = nil;
	ePlaneImage2 = nil;	
	bulletImage = nil;
	bgImage = nil;
	bgLayer1.contents = nil;
	bgLayer2.contents = nil;
	bgMusicPlayer = nil;
	// 使用NSUserDefaults存储系统积分
	[[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"score"];
}
@end
