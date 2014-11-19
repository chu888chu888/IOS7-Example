//
//  FKViewController.m
//  OrientationDecect
//
//  Created by yeeku on 13-10-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "FKViewController.h"

@interface FKViewController () <CLLocationManagerDelegate>
{
	CALayer* znzLayer;
}
@property (nonatomic , strong)CLLocationManager *locationManager;
@end
@implementation FKViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 如果磁力仪可用，开始监听方向改变。
	if([CLLocationManager headingAvailable])
	{
		// 创建显示方向的指南针图片Layer
		znzLayer = [[CALayer alloc] init];
		NSInteger screenHeight = [UIScreen mainScreen].bounds.size.height;
		NSInteger y = (screenHeight - 320) / 2;
		znzLayer.frame = CGRectMake(0 , y , 320, 320);
		// 设置znzLayer显示的图片
		znzLayer.contents = (id)[[UIImage imageNamed:@"znz.png"] CGImage];
		// 将znzLayer添加到系统的UIView中
		[self.view.layer addSublayer:znzLayer];
		// 创建CLLocationManager对象
		self.locationManager = [[CLLocationManager alloc]init];
		self.locationManager.delegate = self;
		[self.locationManager startUpdatingHeading];
	}
	// 如果磁力仪不可用，使用UIAlertView显示提示信息
	else
	{
		// 使用警告框提醒用户
		[[[UIAlertView alloc] initWithTitle:@"提醒"
			message:@"您的设备不支持磁力仪" delegate:self
			cancelButtonTitle:@"确定" otherButtonTitles: nil]
			show];
	}
}
// 当成功获取设备的方向值后激发该方法
-(void)locationManager:(CLLocationManager *)manager
	didUpdateHeading:(CLHeading *)newHeading
{
	// 将设备的方向角度换算弧度。
	CGFloat headings = -1.0f * M_PI * newHeading.magneticHeading / 180.0f;
	// 创建不断改变CALayer的transform属性的属性动画
	CABasicAnimation* anim = [CABasicAnimation
		animationWithKeyPath:@"transform"];
	CATransform3D fromValue = znzLayer.transform;
	// 设置动画开始的属性值
	anim.fromValue = [NSValue valueWithCATransform3D: fromValue];
	// 绕Z轴旋转heading弧度的变换矩阵
	CATransform3D toValue = CATransform3DMakeRotation(headings , 0 , 0 , 1);
	// 设置动画结束的属性
	anim.toValue = [NSValue valueWithCATransform3D: toValue];
	anim.duration = 0.5;
	anim.removedOnCompletion = YES;
	// 设置动画结束后znzLayer的变换矩阵
	znzLayer.transform = toValue;
	// 为znzLayer添加动画
	[znzLayer addAnimation:anim forKey:nil];
}
-(BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager
{
	return YES;
}
@end
