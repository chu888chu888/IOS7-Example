//
//  FKViewController.m
//  MoviePlayerTest
//
//  Created by yeeku on 13-8-7.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
MPMoviePlayerController *moviePlayer;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 创建本地URL（也可创建基于网络的URL)
	NSURL* movieUrl = [[NSBundle mainBundle]
					   URLForResource:@"movie" withExtension:@"mp4"];
	// 使用指定URL创建MPMoviePlayerController
	// MPMoviePlayerController将会播放该URL对应的视频
	moviePlayer = [[MPMoviePlayerController alloc]
		initWithContentURL:movieUrl];
	// 设置该播放器的控制条风格。
	moviePlayer.controlStyle = MPMovieControlStyleEmbedded;
	// 设置该播放器的缩放模式
	moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
	[moviePlayer prepareToPlay];
	[moviePlayer.view setFrame: CGRectMake(0 , 0 , 380 , 320)];
}
// 重写该方法，控制该视图控制器只支持横屏显示
- (NSUInteger)supportedInterfaceOrientations
{
	return UIInterfaceOrientationMaskLandscape;
}
- (IBAction)play:(id)sender
{
	[self.movieView addSubview: moviePlayer.view];
}
@end
