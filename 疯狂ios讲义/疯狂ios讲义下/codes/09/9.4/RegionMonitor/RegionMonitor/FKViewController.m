//
//  FKViewController.m
//  RegionMonitor
//
//  Created by yeeku on 13-10-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//
#import <CoreLocation/CoreLocation.h>
#import "FKViewController.h"

@interface FKViewController () <CLLocationManagerDelegate>
@property (retain,nonatomic) CLLocationManager *locationManager;
@end
@implementation FKViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	if([CLLocationManager locationServicesEnabled])
	{
		self.locationManager = [[CLLocationManager alloc] init];
		self.locationManager.delegate = self;
		// 定义一个CLLocationCoordinate2D作为区域的圆心
		CLLocationCoordinate2D companyCenter;
		companyCenter.latitude = 23.126272;
		companyCenter.longitude = 113.395568;
		// 使用CLCircularRegion创建一个圆形区域，半径为500米
		CLRegion* fkit = [[CLCircularRegion alloc] initWithCenter:companyCenter
			radius:500 identifier:@"fkit"];
		// 开始监听fkit区域
		[self.locationManager startMonitoringForRegion:fkit];
	}
	else
	{
		// 使用警告框提醒用户
		[[[UIAlertView alloc] initWithTitle:@"提醒"
			message:@"您的设备不支持定位" delegate:self
			cancelButtonTitle:@"确定" otherButtonTitles: nil] show];
	}
}
// 进入指定区域以后将弹出提示框提示用户
-(void)locationManager:(CLLocationManager *)manager
	didEnterRegion:(CLRegion *)region
{
	[[[UIAlertView alloc] initWithTitle:@"区域检测提示"
		message:@"您已经【进入】疯狂软件教育中心区域内!" delegate:nil
		cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}
// 进入指定区域以后将弹出提示框提示用户
-(void)locationManager:(CLLocationManager *)manager
		didExitRegion:(CLRegion *)region
{
	[[[UIAlertView alloc] initWithTitle:@"区域检测提示"
		message:@"您已经【离开】疯狂软件教育中心区域内!" delegate:nil
		cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}
@end
