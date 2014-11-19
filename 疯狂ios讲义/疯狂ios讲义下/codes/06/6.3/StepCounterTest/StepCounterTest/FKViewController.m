//
//  FKViewController.m
//  StepCounterTest
//
//  Created by yeeku on 13-10-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import "FKViewController.h"

@interface FKViewController ()
@property (strong , nonatomic) CMStepCounter* stepCounter;
@end
@implementation FKViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 如果计步服务可用
	if([CMStepCounter isStepCountingAvailable])
	{
		// 创建CMStepCounter对象
		self.stepCounter = [[CMStepCounter alloc] init];
		NSOperationQueue *queue = [[NSOperationQueue alloc] init];
		// 开始收集计步信息，设置每行走5步执行一次代码块
		[self.stepCounter startStepCountingUpdatesToQueue: queue updateOn:5
			withHandler:
		^(NSInteger numberOfSteps , NSDate *timestamp, NSError *error)
		{
			self.stepLabel.text = [NSString stringWithFormat:
				@"用户已经行走了【%ld】步！" , numberOfSteps];
		}];
	}
	else
	{
		self.stepLabel.text = @"计步器不可用。";
	}
}
@end
