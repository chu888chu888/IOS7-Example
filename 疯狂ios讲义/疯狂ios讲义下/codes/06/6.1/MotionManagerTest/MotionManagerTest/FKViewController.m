//
//  FKViewController.m
//  MotionManagerTest
//
//  Created by yeeku on 13-10-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import "FKViewController.h"

@interface FKViewController ()
@property (strong , nonatomic) CMMotionManager* motionManager;
@end
@implementation FKViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建CMMotionManager对象
	self.motionManager = [[CMMotionManager alloc] init];  // ①
	NSOperationQueue *queue = [[NSOperationQueue alloc] init];
	// 如果CMMotionManager的支持获取加速度数据
	if (self.motionManager.accelerometerAvailable)
	{
		// 设置CMMotionManager的加速度数据更新频率为0.1秒
		self.motionManager.accelerometerUpdateInterval = 0.1;
		// 使用代码块开始获取加速度数据
		[self.motionManager startAccelerometerUpdatesToQueue:queue withHandler:
		 ^(CMAccelerometerData *accelerometerData, NSError *error)
		{
			NSString *labelText;
			// 如果发生了错误，error不为空
			if (error)
			{
				// 停止获取加速度数据
				[self.motionManager stopAccelerometerUpdates];
				labelText = [NSString stringWithFormat:
					@"获取加速度数据出现错误: %@", error];
			}
			else
			{
				// 分别获取系统在X轴、Y轴、Z轴上的加速度
				labelText = [NSString stringWithFormat:
					@"加速度为\n-----------\nX轴: %+.2f\nY轴: %+.2f\nZ轴: %+.2f",
						accelerometerData.acceleration.x,
						accelerometerData.acceleration.y,
						accelerometerData.acceleration.z];
			}
			// 在主线程中更新accelerometerLabel的文本，显示加速度数据
			[self.accelerometerLabel performSelectorOnMainThread:
			 	@selector(setText:) withObject:labelText waitUntilDone:NO];
		}];
	}
	else
	{
		NSLog(@"该设备不支持获取加速度数据！");
	}
	// 如果CMMotionManager的支持获取陀螺仪数据
	if (self.motionManager.gyroAvailable)
	{
		// 设置CMMotionManager的陀螺仪数据更新频率为0.1秒
		self.motionManager.gyroUpdateInterval = 0.1;
		// 使用代码块开始获取陀螺仪数据
		[self.motionManager startGyroUpdatesToQueue:queue withHandler:
		^(CMGyroData *gyroData, NSError *error)
		{
			NSString *labelText;
			// 如果发生了错误，error不为空
			if (error)
			{
				// 停止获取陀螺仪数据
				[self.motionManager stopGyroUpdates];
				labelText = [NSString stringWithFormat:
					@"获取陀螺仪数据出现错误: %@", error];
			}
			else
			{
				// 分别获取设备绕X轴、Y轴、Z轴上的转速
				labelText = [NSString stringWithFormat:
					@"绕各轴的转速为\n--------\nX轴: %+.2f\nY轴: %+.2f\nZ轴: %+.2f",
					gyroData.rotationRate.x,
					gyroData.rotationRate.y,
					gyroData.rotationRate.z];
			}
			// 在主线程中更新gyroLabel的文本，显示绕各轴的转速
			[self.gyroLabel performSelectorOnMainThread:@selector(setText:)
				withObject:labelText waitUntilDone:NO];
		 }];
	}
	else
	{
		NSLog(@"该设备不支持获取陀螺仪数据！");
	}
	// 如果CMMotionManager的支持获取磁场数据
	if (self.motionManager. magnetometerAvailable)
	{
		// 设置CMMotionManager的磁场数据更新频率为0.1秒
		self.motionManager.magnetometerUpdateInterval = 0.1;
		[self.motionManager startMagnetometerUpdatesToQueue:queue withHandler:
		^(CMMagnetometerData* magnetometerData, NSError *error)
		{
			NSString *labelText;
			// 如果发生了错误，error不为空
			if (error)
			{
				// 停止获取磁场数据
				[self.motionManager stopMagnetometerUpdates];
				labelText = [NSString stringWithFormat:
					@"获取磁场数据出现错误: %@", error];
			}
			else
			{
				labelText = [NSString stringWithFormat:
					@"磁场数据为\n--------\nX轴: %+.2f\nY轴: %+.2f\nZ轴: %+.2f",
					magnetometerData.magneticField .x,
					magnetometerData.magneticField .y,
					magnetometerData.magneticField .z];
			}
			// 在主线程中更新magnetometerLabel的文本，显示磁场数据
			[self.magnetometerLabel performSelectorOnMainThread:
				@selector(setText:) withObject:labelText waitUntilDone:NO];
		 }];
	}
	else
	{
		NSLog(@"该设备不支持获取磁场数据！");
	}
}
@end
