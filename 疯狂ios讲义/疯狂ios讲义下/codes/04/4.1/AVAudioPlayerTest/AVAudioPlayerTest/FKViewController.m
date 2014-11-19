//
//  FKViewController.m
//  AVAudioPlayerTest
//
//  Created by yeeku on 13-8-7.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
AVAudioPlayer* audioPlayer;
UIImage* playImage;
UIImage* pauseImage;
UIImage* stopImage;
CGFloat durationTime;
NSTimer* timer;
- (void)viewDidLoad
{
	[super viewDidLoad];
	playImage = [UIImage imageNamed:@"play.png"];
	pauseImage = [UIImage imageNamed:@"pause.png"];
	stopImage = [UIImage imageNamed:@"stop.png"];
	// 为两个按钮设置图片
	[self.bn1 setImage:playImage forState:UIControlStateNormal];
	[self.bn2 setImage:stopImage forState:UIControlStateNormal];
	// 获取要播放的音频文件的URL
	NSURL* fileURL = [[NSBundle mainBundle]
					  URLForResource:@"star" withExtension:@"mp3"];
	// 创建AVAudioPlayer对象
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL
		error: nil];
	NSString* msg = [NSString stringWithFormat:
		@"音频文件的声道数：%d\n音频文件的持续时间：%g",
		audioPlayer.numberOfChannels,
		audioPlayer.duration];
	self.show.text = msg;
	durationTime = audioPlayer.duration;
	// 将循环次数设为-1，用于指定该音频文件循环播放
//	audioPlayer.numberOfLoops = -1;
	// 为AVAudioPlayer设置代理，监听它的播放事件
	audioPlayer.delegate = self;
}
// 当AVAudioPlayer播放完成收将会自动激发该方法
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player
					   successfully:(BOOL)flag
{
	if (player == audioPlayer && flag)
	{
		NSLog(@"播放完成！！");
		[self.bn1 setImage:playImage forState:UIControlStateNormal];
	}
}
- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player
{
	if (player == audioPlayer)
	{
		NSLog(@"被中断！！");
	}
}
- (IBAction)play:(id)sender {
	// 如果当前正在播放
	if (audioPlayer.playing)
	{
		// 暂停播放
		[audioPlayer pause];
		[sender setImage:playImage forState:UIControlStateNormal];
	}
	else
	{
		// 播放音频
		[audioPlayer play];
		[sender setImage:pauseImage forState:UIControlStateNormal];
	}
	// 如果timer为nil，执行如下方法
	if (timer == nil)
	{
		// 周期性地执行某个方法
		timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self
			selector:@selector(updateProg) userInfo:nil repeats:YES];
	}
}
- (IBAction)stop:(id)sender {
	// 停止播放音频
	[audioPlayer stop];
	[timer invalidate];
	timer = nil;
}
- (void) updateProg
{
	self.prog.progress = audioPlayer.currentTime / durationTime;
}
@end
