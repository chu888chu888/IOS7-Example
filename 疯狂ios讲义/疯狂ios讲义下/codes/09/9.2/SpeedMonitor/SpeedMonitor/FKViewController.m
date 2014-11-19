//
//  FKViewController.m
//  SpeedMonitor
//
//  Created by yeeku on 13-10-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface FKViewController () <CLLocationManagerDelegate>
@property (nonatomic , retain) CLLocationManager *locationManager;
@property (nonatomic , retain) CLLocation *prevLocation;
@property (nonatomic , assign) CGFloat sumDistance;
@property (nonatomic , assign) CGFloat sumTime;
@end
@implementation FKViewController
- (void) viewDidLoad
{
	[super viewDidLoad];
	// 创建CLLocationManager对象
	self.locationManager = [[CLLocationManager alloc] init];
}
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	// 设置定位精度：最佳精度
	self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	// 设置距离过滤器为50米，表示每移动50米更新一次位置
	self.locationManager.distanceFilter = 50;
	// 将视图控制器自身设置为CLLocationManager的delegate
	// 因此该视图控制器需要实现CLLocationManagerDelegate协议
	self.locationManager.delegate = self;
	// 开始监听定位信息
	[self.locationManager startUpdatingLocation];
	NSLog(@"开始执行定位服务" );
}
// 定位失败时激发的方法
- (void)locationManager:(CLLocationManager *)manager
	   didFailWithError:(NSError *)error
{
	NSLog(@"定位失败: %@",error);
}
// 成功获取定位数据后将会激发该方法
-(void)locationManager:(CLLocationManager *)manager
	didUpdateLocations:(NSArray *)locations
{
	// 获取最后一个定位数据
	CLLocation* newLocation = [locations lastObject];
	if(newLocation.horizontalAccuracy < kCLLocationAccuracyHundredMeters)
	{
		if(self.prevLocation)
		{
			// 计算本次定位数据与上次定位数据之间的时间差
			NSTimeInterval dTime = [newLocation.timestamp
				timeIntervalSinceDate:self.prevLocation.timestamp];
			// 累计行车时间
			self.sumTime += dTime;
			// 计算本次定位数据与上次定位数据之间的距离
			CGFloat distance = [newLocation
				distanceFromLocation:self.prevLocation];
			// 如果距离小于1米，忽略本次数据，直接返回该方法
			if(distance < 1.0f)
			{
				return;
			}
			// 累加移动距离
			self.sumDistance += distance;
			// 计算移动速度，将m/s换算成公里/小时，需要乘以3.6
			CGFloat speed = distance / dTime * 3.6;
			// 计算平均速度
			CGFloat avgSpeed = self.sumDistance / self.sumTime * 3.6;
			NSString * speedFeedback = [NSString stringWithFormat:
				@"当前速度为：%g千米/小时，平均速度为:%g千米/小时。合计移动:%g千米",
				speed , avgSpeed , self.sumDistance / 1000];
			self.showView.text = speedFeedback;
		}
		self.prevLocation = newLocation;
	}
}
@end
