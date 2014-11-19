//
//  FKViewController.m
//  Gradienter
//
//  Created by yeeku on 13-10-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import "FKViewController.h"
#import "FKMyView.h"

#define MAX_ANGLE (M_PI / 6)
@interface FKViewController ()
{
	FKMyView* show;
	CMMotionManager* motionManager;
	// 定义背景图片，该背景图片将作为水平仪的背景
	UIImage* back;
	// 下面两个变量定义背景图片的宽度、高度
	CGFloat backWidth;
	CGFloat backHeight;
}
@end
@implementation FKViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
	back = [UIImage imageNamed:@"back.png"];
	backWidth = back.size.width;
	backHeight = back.size.height;
	// 计算该FKMyView的起始点的X坐标
	CGFloat startX = (self.view.bounds.size.width - backWidth) / 2;
	// 创建FKMyView，为该控件设置背景，并将该控件添加到视图控制器管理的UIView内。
	show = [[FKMyView alloc] initWithFrame:CGRectMake(startX , startX + 20,
		backWidth , backHeight)];
	show.backgroundColor = [UIColor colorWithPatternImage:back];
	[self.view addSubview:show];
	// 创建CMMotionManager对象
	motionManager = [[CMMotionManager alloc] init];
	if(motionManager.deviceMotionAvailable)
	{
		// 设置获取移动信息的更新频率
		motionManager.deviceMotionUpdateInterval = 0.1;
		NSOperationQueue* queue = [[NSOperationQueue alloc] init];
		[motionManager startDeviceMotionUpdatesToQueue:queue withHandler:
		^(CMDeviceMotion *motion, NSError *error)
		{
			// 获取设备顶部翘起的角度
			CGFloat pitchAngle = motion.attitude.pitch;
			// 获取设备左侧翘起的角度
			CGFloat rollAngle = motion.attitude.roll;
			// 气泡位于中间时（水平仪完全水平），气泡的X、Y座标
			CGFloat x = (backWidth - show.bubble.size.width) / 2;
			CGFloat y = (backHeight - show.bubble.size.height) / 2;
			// 如果设备左侧翘起的角度还在最大角度之内
			if (fabs(rollAngle) <= MAX_ANGLE)
			{
				 // 根据设备左侧翘起的角度计算X座标的变化值（倾斜角度越大，X座标变化越大）
				CGFloat deltaX = (backWidth - show.bubble.size.width) / 2 *
					rollAngle / MAX_ANGLE;
				 x -= deltaX;
			}
			// 如果设备左侧翘起的角度已经大于MAX_ANGLE，气泡应到最左边
			else if (rollAngle > MAX_ANGLE)
			{
				x = 0;
			}
			// 如果设备左侧翘起的角度已经小于负的MAX_ANGLE，气泡应到最右边
			else
			{
				x = backWidth - show.bubble.size.width;
			}
			// 如果设备顶部翘起的角度还在最大角度之内
			if (fabs(pitchAngle) <= MAX_ANGLE)
			{
				// 根据设备顶部翘起的角度计算Y座标的变化值（倾斜角度越大，Y座标变化越大）
				CGFloat deltaY = (backHeight - show.bubble.size.height) / 2 *
					pitchAngle / MAX_ANGLE;
				y -= deltaY;
			}
			// 如果设备顶部翘起的角度已经大于MAX_ANGLE，气泡应到最下边
			else if (pitchAngle > MAX_ANGLE)
			{
				y = backHeight - show.bubble.size.height;
			}
			// 如果设备顶部翘起的角度已经小于负的MAX_ANGLE，气泡应到最上边
			else
			{
				y = 0;
			}
			// 如果计算出来的X、Y座标还位于水平仪的仪表盘内，更新水平仪的气泡座标
			if ([self isContainPoinyAtX:x y:y])
			{
				show.bubbleX = x;
				show.bubbleY = y;
			}
			// 通知系统重绘FKMyView组件
			[show performSelectorOnMainThread:@selector(setNeedsDisplay)
				withObject:nil waitUntilDone:NO];
		 }];
	}
	else
	{
		NSLog(@"设备活动不可用。");
	}
}
// 计算x、y点的气泡是否处于水平仪的仪表盘内
- (BOOL) isContainPoinyAtX:(NSInteger) x y:(NSInteger) y
{
	// 计算气泡的圆心座标X、Y
	int bubbleCx = x + show.bubble.size.width / 2;
	int bubbleCy = y + show.bubble.size.height / 2;
	// 计算水平仪仪表盘的圆心座标X、Y
	int backCx = backWidth / 2;
	int backCy = backHeight / 2;
	// 计算气泡的圆心与水平仪仪表盘的圆心之间的距离。
	double distance = sqrtf((bubbleCx - backCx) * (bubbleCx - backCx)
		+ (bubbleCy - backCy) * (bubbleCy - backCy));
	// 若两个圆心的距离小于它们的半径差，即可认为处于该点的气泡依然位于仪表盘内
	if (distance < (backWidth - show.bubble.size.width) / 2)
	{
		return YES;
	}
	else
	{
		return NO;
	}
}
@end
