//
//  FKViewController.m
//  AVAudioRecorderTest
//
//  Created by yeeku on 13-8-7.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
AVAudioRecorder* audioRecorder;
UIImage* recordImage;
UIImage* stopImage;
AVAudioPlayer* audioPlayer;
- (void)viewDidLoad
{
	[super viewDidLoad];
	recordImage = [UIImage imageNamed:@"record.png"];
	stopImage = [UIImage imageNamed:@"stop.png"];
								  
	[self.recordBn setImage:recordImage forState:UIControlStateNormal];
	// 获取当前应用的音频会话
	AVAudioSession * audioSession = [AVAudioSession sharedInstance];
	// 设置音频类别，PlayAndRecord——这说明当前音频会话即可播放、也可录制
	[audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error: nil];
	// 激活当前应用的音频会话
	[audioSession setActive:YES error: nil];
}
//获取document目录的路径
- (NSString*) documentsPath {
	if (! _documentsPath) {
		NSArray *searchPaths =
		NSSearchPathForDirectoriesInDomains
		(NSDocumentDirectory, NSUserDomainMask, YES);
		_documentsPath = [searchPaths objectAtIndex: 0];
	}
	return _documentsPath;
}
- (IBAction)clicked:(id)sender
{
	if(audioRecorder != nil && audioRecorder.isRecording)
	{
		[audioRecorder stop];
		[self.recordBn setImage:recordImage forState:UIControlStateNormal];
	}
	else
	{
		// 获取音频文件的保存路径
		NSString *destinationString = [[self documentsPath]
			stringByAppendingPathComponent:@"sound.wav"];
		NSURL *destinationURL = [NSURL fileURLWithPath:destinationString];
		// 创建一个NSDictionary，用于保存录制属性
		NSMutableDictionary *recordSettings = [[NSMutableDictionary alloc] init];
		// 设置录制音频的格式
		[recordSettings setObject:[NSNumber numberWithInt:kAudioFormatLinearPCM]
			forKey: AVFormatIDKey];
		NSString* sampleRate = [self.sampleRateSeg titleForSegmentAtIndex:
			self.sampleRateSeg.selectedSegmentIndex];
		// 设置录制音频的采样率
		[recordSettings setObject:[NSNumber numberWithFloat:
			sampleRate.floatValue] forKey: AVSampleRateKey];
		// 设置录制音频的通道数
		[recordSettings setObject:
			[NSNumber numberWithInt:(self.stereoSwitch.on ? 2 : 1)]
			forKey:AVNumberOfChannelsKey];
		NSString* bitDepth = [self.bitDeptSeg titleForSegmentAtIndex:
			self.bitDeptSeg.selectedSegmentIndex];
		// 设置录制音频的每个样点的位数
		[recordSettings setObject: [NSNumber numberWithInt:bitDepth.integerValue]
			forKey:AVLinearPCMBitDepthKey];
		// 设置录制音频采用高位优先的记录格式
		[recordSettings setObject:[NSNumber numberWithBool:YES]
			forKey:AVLinearPCMIsBigEndianKey];
		// 设置采样信号采用浮点数
		[recordSettings setObject:[NSNumber numberWithBool:YES]
			forKey:AVLinearPCMIsFloatKey];
		NSError *recorderSetupError = nil;
		// 初始化AVAudioRecorder
		audioRecorder = [[AVAudioRecorder alloc] initWithURL:destinationURL
			settings:recordSettings  error:&recorderSetupError];
		audioRecorder.delegate = self;
		[audioRecorder record];
		[self.recordBn setImage:stopImage forState:UIControlStateNormal];
	}
}
- (IBAction)play:(id)sender
{
	// 获取音频文件的保存路径
	NSString *destinationString = [[self documentsPath]
		stringByAppendingPathComponent:@"sound.wav"];
	NSURL *url = [NSURL fileURLWithPath:destinationString];
	// 创建AVAudioPlayer对象
	audioPlayer = [[AVAudioPlayer alloc]
		initWithContentsOfURL:url error: nil];
	// 开始播放
	[audioPlayer play];
}
- (void)audioRecorderBeginInterruption:(AVAudioRecorder *)recorder
{
	NSLog(@"被中断！");
}
- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)aRecorder
	successfully:(BOOL)flag
{
	if(flag)
	{
		NSLog(@"录制完成！！");
	}
}
@end
