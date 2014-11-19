//
//  FKViewController.m
//  SystemSoundTest
//
//  Created by yeeku on 13-8-7.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import "FKViewController.h"

static void completionCallback(SystemSoundID mySSID)
{
	// Play again after sound play completion
	AudioServicesPlaySystemSound(mySSID);
}
@implementation FKViewController
SystemSoundID crash;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 定义要播放的音频文件的URL
	NSURL* crashUrl = [[NSBundle mainBundle]
					   URLForResource:@"crash" withExtension:@"wav"];
	// 加载音效文件
	AudioServicesCreateSystemSoundID((__bridge CFURLRef)crashUrl , &crash);
	// 为crash播放完成绑定回调函数
	AudioServicesAddSystemSoundCompletion(crash, NULL, NULL,
		(void*)completionCallback ,NULL);
}
- (IBAction)play:(id)sender {
	//	// 播放crash代表的音频
	AudioServicesPlaySystemSound(crash);
	// 播放crash代表的音频，并控制设备震动
//	AudioServicesPlayAlertSound(crash);
}
@end

