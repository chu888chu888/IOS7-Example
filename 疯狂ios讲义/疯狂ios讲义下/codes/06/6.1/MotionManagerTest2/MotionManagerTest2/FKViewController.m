//
//  FKViewController.m
//  MotionManagerTest2
//
//  Created by yeeku on 13-10-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import "FKViewController.h"

@interface FKViewController ()
{
	NSTimer* updateTimer;
}
@property (strong, nonatomic) CMMotionManager* motionManager;
@end
@implementation FKViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建CMMotionManager对象
	self.motionManager = [[CMMotionManager alloc] init];  // ①
	// 如果CMMotionManager的支持获取加速度数据
	if (self.motionManager.accelerometerAvailable)
	{
		[self.motionManager startAccelerometerUpdates];
	}
	else
	{
		NSLog(@"该设备不支持获取加速度数据！");
	}
	// 如果CMMotionManager的支持获取陀螺仪数据
	if (self.motionManager.gyroAvailable)
	{
		[self.motionManager startGyroUpdates];
	}
	else
	{
		NSLog(@"该设备不支持获取陀螺仪数据！");
	}
	// 如果CMMotionManager的支持获取磁场数据
	if (self.motionManager.magnetometerAvailable)
	{
		[self.motionManager startMagnetometerUpdates];
	}
	else
	{
		NSLog(@"该设备不支持获取磁场数据！");
	}
}
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	// 启动定时器来周期性地轮询加速度、陀螺仪、磁场数据
	updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.1
		target:self selector:@selector(updateDisplay)
		userInfo:nil repeats:YES];  // ②
}
- (void)updateDisplay
{
	// 如果CMMotionManager的加速度数据可用
	if (self.motionManager.accelerometerAvailable)
	{
		// 主动请求获取加速度数据
		CMAccelerometerData* accelerometerData = self.motionManager.accelerometerData;
		self.accelerometerLabel.text  = [NSString stringWithFormat:
			@"加速度为\n-----------\nX轴: %+.2f\nY轴: %+.2f\nZ轴: %+.2f",
			accelerometerData.acceleration.x,
			accelerometerData.acceleration.y,
			accelerometerData.acceleration.z];
	}
	// 如果CMMotionManager的陀螺仪数据可用
	if (self.motionManager.gyroAvailable)
	{
		// 主动请求获取陀螺仪数据
		CMGyroData* gyroData = self.motionManager.gyroData;
		self.gyroLabel.text = [NSString stringWithFormat:
			@"绕各轴的转速为\n--------\nX轴: %+.2f\nY轴: %+.2f\nZ轴: %+.2f",
			gyroData.rotationRate.x,
			gyroData.rotationRate.y,
			gyroData.rotationRate.z];
	}
	// 如果CMMotionManager的磁场数据可用
	if (self.motionManager.magnetometerAvailable)
	{
		// 主动请求获取磁场数据
		CMMagnetometerData* magnetometerData = self.motionManager.magnetometerData;
		self.magnetometerLabel.text =  [NSString stringWithFormat:
			@"磁场数据为\n--------\nX轴: %+.2f\nY轴: %+.2f\nZ轴: %+.2f",
			magnetometerData.magneticField .x,
			magnetometerData.magneticField .y,
			magnetometerData.magneticField .z];
	}
}
@end
