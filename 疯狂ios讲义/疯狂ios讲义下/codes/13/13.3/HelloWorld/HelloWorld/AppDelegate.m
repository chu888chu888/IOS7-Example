//
//  AppDelegate.m
//  HelloWorld
//
//  Created by Jason on 13-10-12.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//

#import "cocos2d.h"

#import "AppDelegate.h"
#import "IntroLayer.h"

@implementation AppController

@synthesize window=window_, navController=navController_, director=director_;

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// 创建程序的主窗口。
	window_ = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	// 创建CCGLView对象，用于游戏中的渲染。
	// 从cocos2d 2.0之后，CCGLView替代了之前的EAGLView，
	// 使用CCGLView将OpenGL ES命令发送给OpenGL ES驱动。
	CCGLView *glView = [CCGLView viewWithFrame:[window_ bounds]
		pixelFormat:kEAGLColorFormatRGB565
		depthFormat:0 preserveBackbuffer:NO
		sharegroup:nil multiSampling:NO numberOfSamples:0];
	// ①创建导演对象
	director_ = (CCDirectorIOS*) [CCDirector sharedDirector];
	director_.wantsFullScreenLayout = YES;
	// 将FPS(Frames Per Second)和SPF(Second Per Frame)显示设置为开。
	// cocos2d会自动计算游戏的当前帧数，并显示在屏幕的左下角。
	// 在调试过程中FPS显示对我们调试会非常有用，
	// 在游戏正式上传到设备时可以将其设置为NO，则FPS和SPF不会再显示在设备中。
	[director_ setDisplayStats:YES];
	// 将动画间距设置为每秒60次，这也是cocos2d中的默认设置。
	// 正常情况下，cocos2d每秒最高会刷新屏幕中的显示60次。
	[director_ setAnimationInterval:1.0/60];
	// 将openglView绑定到director_导演对象上。
	[director_ setView:glView];
	// 将director_的代理对象设置为self（自身），用于获取屏幕信息。
	[director_ setDelegate:self];
	// 设置2D或3D投射。
	[director_ setProjection:kCCDirectorProjection2D];
//	[director setProjection:kCCDirectorProjection3D];
	// 启用Retina高清显示模式。
	if( ! [director_ enableRetinaDisplay:YES] )
		CCLOG(@"Retina Display Not supported");
	// 设置cocos2d的纹理格式。
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
	// 在iPad或Retina高清显示模式下，使用CCFileUtils自动添加图片的后缀。
	CCFileUtils *sharedFileUtils = [CCFileUtils sharedFileUtils];
	[sharedFileUtils setEnableFallbackSuffixes:NO];
	[sharedFileUtils setiPhoneRetinaDisplaySuffix:@"-hd"];
	[sharedFileUtils setiPadSuffix:@"-ipad"];
	[sharedFileUtils setiPadRetinaDisplaySuffix:@"-ipadhd"];
	// 设置PVR图像具备多重透明度。
	[CCTexture2D PVRImagesHavePremultipliedAlpha:YES];
	// ②初始化IntroLayer场景，并使用pushScene方法切换到该场景。
	[director_ pushScene: [IntroLayer scene]];
	// 使用director_创建NavigationController导航控制器。
	navController_ = [[UINavigationController alloc]
                      initWithRootViewController:director_];
	// 设置navigationBarHidden为YES。
	navController_.navigationBarHidden = YES;
	// 将NavigationController导航控制器设置为根视图控制器。
	[window_ setRootViewController:navController_];
	// 设置主窗口可见。
	[window_ makeKeyAndVisible];
	return YES;
}

// Supported orientations: Landscape. Customize it for your own needs
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}


// 当操作系统暂停应用时执行，调用此方法来暂停游戏和所有的计时器。
// 当玩家在玩游戏的过程中锁定了iPad或iPhone，或是有电话打进来,
// 或其他类似事件发生需要强迫游戏进入后台时，会调用此方法。
-(void) applicationWillResignActive:(UIApplication *)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ pause];
}
// 当玩家解锁iPad或iPhone，或电话已接听完毕，会调用此方法来继续游戏和所有的计时器。
-(void) applicationDidBecomeActive:(UIApplication *)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ resume];
}
// 在iOS 4.0及以后的版本中，开始支持应用的后台运行，此时会停止运行屏幕中的动画。
-(void) applicationDidEnterBackground:(UIApplication*)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ stopAnimation];
}
// 当应用重新回到前台来运行时，重新启动屏幕中的动画。
-(void) applicationWillEnterForeground:(UIApplication*)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ startAnimation];
}
// 应用程序即将中止时调用此方法
// 该方法会终止CCDirector的控制，并从应用程序的UIWindow中解除对CCGLView的绑定
// 同时还将结束游戏循环，从内存中清除所有的纹理和计时器。
- (void)applicationWillTerminate:(UIApplication *)application
{
	CC_DIRECTOR_END();
}
// 当系统收到内存不足的警告时，会调用此方法从内存中清除未在屏幕中显示的纹理图。
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
	[[CCDirector sharedDirector] purgeCachedData];
}
// 将上一次时间调用和当前事件调用间的增量时间设置为0。
// 该方法的调用场景是：两次调用之间已经过了太长的时间。
// 这通常是由于iPhone重新调整了系统时间而导致。
-(void) applicationSignificantTimeChange:(UIApplication *)application
{
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}
@end
