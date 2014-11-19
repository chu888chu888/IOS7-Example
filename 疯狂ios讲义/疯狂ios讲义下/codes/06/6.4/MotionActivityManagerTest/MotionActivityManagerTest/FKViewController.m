//
//  FKViewController.m
//  MotionActivityManagerTest
//
//  Created by yeeku on 13-10-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import "FKViewController.h"

@interface FKViewController ()
@property (nonatomic , strong) CMMotionActivityManager* motionActivityManager;
@end
@implementation FKViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 如果设备支持获取运动数据
	if(CMMotionActivityManager.isActivityAvailable)
	{
		// 创建CMMotionActivityManager对象
		self.motionActivityManager = [[CMMotionActivityManager alloc] init];
		NSOperationQueue* queue = [[NSOperationQueue alloc] init];
		// 开始收集运动数据，当收集到运动信息时执行传给该方法的代码块参数
		[self.motionActivityManager startActivityUpdatesToQueue:queue withHandler:
		^(CMMotionActivity *activity)
		{
			NSMutableString* str = [NSMutableString
				stringWithString:@"---运动信息---\n"];
			// 获取运动信息
			[str appendFormat:@"是否步行：%d\n" ,activity.walking];
			[str appendFormat:@"是否跑步：%d\n" ,activity.running];
			[str appendFormat:@"是否驾车：%d\n" ,activity.automotive];
			[str appendFormat:@"是否静止：%d\n" ,activity.stationary];
			[str appendFormat:@"是否未知：%d\n" ,activity.unknown];
			self.activityLabel.text = str;
		}];
	}
	else
	{
		self.activityLabel.text = @"该设备不支持获取运动数据！";
	}
}
@end
