//
//  FKViewController.m
//  MoveBall
//
//  Created by yeeku on 13-10-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import "FKViewController.h"
#import "FKBallView.h"

@interface FKViewController ()
@property (strong, nonatomic) CMMotionManager* motionManager;
@property (weak, nonatomic) FKBallView* ballView;
@end
@implementation FKViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建以grass.png图片平铺的颜色
	UIColor* bgColor = [UIColor colorWithPatternImage:
		[UIImage imageNamed:@"grass"]];
	// 将该视图控制器管理的View控件转换为FKBallView
	self.ballView = (FKBallView*)self.view;
	// 将背景设为以grass.png图片平铺的颜色
	self.ballView.backgroundColor = bgColor;
	// 创建CMMotionManager对象
	self.motionManager = [[CMMotionManager alloc] init];
	NSOperationQueue* queue = [[NSOperationQueue alloc] init];
	// 设置CMMotionManager获取加速度数据的频率
	self.motionManager.accelerometerUpdateInterval = 0.05;
	// 使用代码块获取加速度数据
	[self.motionManager startAccelerometerUpdatesToQueue:queue withHandler:
	^(CMAccelerometerData *accelerometerData, NSError *error)
	{
		// 将获取得到的加速度数据传给FKBallView对象
		self.ballView.acceleration = accelerometerData.acceleration;
		// 在主线程中调用FKBallView对象的update方法
		[self.ballView performSelectorOnMainThread:@selector(update)
			withObject:nil waitUntilDone:NO];
	}];
}
@end
