//
//  FKViewController.m
//  DeviceMotionTest
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
@property (strong , nonatomic) CMMotionManager* motionManager;
@end
@implementation FKViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// 创建CMMotionManager对象
	self.motionManager = [[CMMotionManager alloc] init];
	// 如果可以获取设备的动作信息
	if (self.motionManager.deviceMotionAvailable)
	{
		// 开始更新设备的动作信息
		[self.motionManager startDeviceMotionUpdates];
	}
	else
	{
		NSLog(@"该设备的的deviceMotion不可用");
	}
}
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	// 使用定时器周期性地获取设备移动信息
	updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.1
		target:self selector:@selector(updateDisplay)
		userInfo:nil repeats:YES];
}
- (void)updateDisplay
{
	if (self.motionManager.deviceMotionAvailable)
	{
		// 获取设备移动信息
		CMDeviceMotion *deviceMotion = self.motionManager.deviceMotion;
		NSMutableString* str = [NSMutableString
			stringWithString:@"deviceMotion信息为：\n"];
		[str appendString:@"---attitude信息---\n"];
		[str appendFormat:@"attitude的yaw：%+.2f\n", deviceMotion.attitude.yaw];
		[str appendFormat:@"attitude的pitch：%+.2f\n" , deviceMotion.attitude.pitch];
		[str appendFormat:@"attitude的roll：%+.2f\n" , deviceMotion.attitude.roll];
		[str appendString:@"---rotationRate信息---\n"];
		[str appendFormat:@"rotationRate的X：%+.2f\n", deviceMotion.rotationRate.x];
		[str appendFormat:@"rotationRate的Y：%+.2f\n" , deviceMotion.rotationRate.y];
		[str appendFormat:@"rotationRate的Z：%+.2f\n" , deviceMotion.rotationRate.z];
		[str appendString:@"---gravity信息---\n"];
		[str appendFormat:@"gravity的X：%+.2f\n", deviceMotion.gravity.x];
		[str appendFormat:@"gravity的Y：%+.2f\n" , deviceMotion.gravity.y];
		[str appendFormat:@"gravity的Z：%+.2f\n" , deviceMotion.gravity.z];
		[str appendString:@"---magneticField信息---\n"];
		[str appendFormat:@"magneticField的精度：%d\n",
			deviceMotion.magneticField.accuracy];
		[str appendFormat:@"magneticField的X：%+.2f\n",
			deviceMotion.magneticField.field.x];
		[str appendFormat:@"magneticField的Y：%+.2f\n" ,
			deviceMotion.magneticField.field.y];
		[str appendFormat:@"magneticField的Z：%+.2f\n" ,
			deviceMotion.magneticField.field.z];
		self.showField.text = str;
	}
}
@end
