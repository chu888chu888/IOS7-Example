//
//  FKViewController.m
//  LocationTest
//
//  Created by yeeku on 13-10-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//


#import <CoreLocation/CoreLocation.h>
#import "FKViewController.h"

@interface FKViewController () <CLLocationManagerDelegate>
@property (strong,nonatomic)CLLocationManager *locationManager;
@end
@implementation FKViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建CLLocationManager对象
	self.locationManager = [[CLLocationManager alloc]init];
}
- (IBAction)bnTapped:(id)sender
{
	// 如果定位服务可用
	if([CLLocationManager locationServicesEnabled])
	{
		NSLog( @"开始执行定位服务" );
		// 设置定位精度：最佳精度
		self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
		// 设置距离过滤器为50米，表示每移动50米更新一次位置
		self.locationManager.distanceFilter = 50;
		// 将视图控制器自身设置为CLLocationManager的delegate
		// 因此该视图控制器需要实现CLLocationManagerDelegate协议
		self.locationManager.delegate = self;
		// 开始监听定位信息
		[self.locationManager startUpdatingLocation];
	}
	else
	{
		NSLog( @"无法使用定位服务！" );
	}
}
// 成功获取定位数据后将会激发该方法
-(void)locationManager:(CLLocationManager *)manager
	didUpdateLocations:(NSArray *)locations
{
	// 获取最后一个定位数据
	CLLocation* location = [locations lastObject];
	// 依次获取CLLocation中封装的经度、纬度、高度、速度、方向等信息。
	self.latitudeTxt.text = [NSString stringWithFormat:@"%g",
		location.coordinate.latitude];
	self.longitudeTxt.text = [NSString stringWithFormat:@"%g",
		location.coordinate.longitude];
	self.altitudeTxt.text = [NSString stringWithFormat:@"%g",
		location.altitude];
	self.speedTxt.text = [NSString stringWithFormat:@"%g",
		location.speed];
	NSLog(@"~~~~%g" , location.speed);
	self.courseTxt.text = [NSString stringWithFormat:@"%g",
		location.course];
}
// 定位失败时激发的方法
- (void)locationManager:(CLLocationManager *)manager
	didFailWithError:(NSError *)error
{
	NSLog(@"定位失败: %@",error);
}
@end
