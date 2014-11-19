//
//  FKViewController.m
//  LocateMap
//
//  Created by yeeku on 13-10-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "FKViewController.h"

@interface FKViewController ()
{
	CLGeocoder* geocoder;
}
@end
@implementation FKViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
	geocoder = [[CLGeocoder alloc] init];
	// 设置地图的显示风格，此处设置使用标准地图
	self.mapView.mapType = MKMapTypeStandard;
	// 设置地图可缩放
	self.mapView.zoomEnabled = YES;
	// 设置地图可滚动
	self.mapView.scrollEnabled = YES;
	// 设置地图可旋转
	self.mapView.rotateEnabled = YES;
	// 设置显示用户当前位置
	self.mapView.showsUserLocation = YES;
	// 调用自己实现的方法设置地图的显示位置和显示区域
	[self locateToLatitude:23.126272 longitude:113.395568];
	// 创建一个手势处理器，用于检测、处理长按手势
	UILongPressGestureRecognizer* gesture = [[UILongPressGestureRecognizer
		alloc]initWithTarget:self action:@selector(longPress:)];
	// 为该控件添加手势处理器
	[self.view addGestureRecognizer:gesture];
}
- (IBAction)goClicked:(id)sender
{
	// 关闭两个文本框的虚拟键盘
	[self.latitudeField resignFirstResponder];
	[self.longitudeField resignFirstResponder];
	NSString* latitudeStr = self.latitudeField.text;
	NSString* longtitudeStr = self.longitudeField.text;
	// 如果用户输入的经度、纬度不为空
	if (latitudeStr != nil && latitudeStr.length > 0
		&& longtitudeStr != nil && longtitudeStr.length > 0)
	{
		// 调用自己实现的方法设置地图的显示位置和显示区域
		[self locateToLatitude:latitudeStr.floatValue
			longitude:longtitudeStr.floatValue];
	}
}
- (void)locateToLatitude:(CGFloat)latitude longitude:(CGFloat)longitude
{
	// 设置地图中心的经、纬度
	CLLocationCoordinate2D center = {latitude , longitude};
	// 设置地图显示的范围，
	MKCoordinateSpan span;
	// 地图显示范围越小，细节越清楚
	span.latitudeDelta = 0.005;
	span.longitudeDelta = 0.005;
	// 创建MKCoordinateRegion对象，该对象代表了地图的显示中心和显示范围。
	MKCoordinateRegion region = {center,span};
	// 设置当前地图的显示中心和显示范围
	[self.mapView setRegion:region animated:YES];
	// 创建MKPointAnnotation对象——代表一个锚点
	MKPointAnnotation* annotation = [[MKPointAnnotation alloc] init];
	annotation.title = @"疯狂软件教育中心";
	annotation.subtitle = @"广州天河区车陂大岗路4号沣宏大厦";
	CLLocationCoordinate2D coordinate = {latitude , longitude};
	annotation.coordinate = coordinate;
	// 添加锚点
	[self.mapView addAnnotation:annotation];
}
- (void) longPress:(UILongPressGestureRecognizer*)gesture
{
	// 获取长按点的坐标
	CGPoint pos = [gesture locationInView:self.mapView];
	// 将长按点的坐标转换为经度、维度值
	CLLocationCoordinate2D coord = [self.mapView convertPoint:pos
		toCoordinateFromView:self.mapView];
	// 将经度、维度值包装为CLLocation对象
	CLLocation* location = [[CLLocation alloc] initWithLatitude:coord.latitude
		longitude:coord.longitude];
	// 根据经、纬度反向解析地址
	[geocoder reverseGeocodeLocation:location completionHandler:
	 	^(NSArray *placemarks, NSError *error)
	{
		if (placemarks.count > 0 && error == nil)
		{
			// 获取解析得到的第一个地址信息
			CLPlacemark* placemark = [placemarks objectAtIndex:0];
			// 获取地址信息中的FormattedAddressLines对应的详细地址
			NSArray* addrArray = placemark
				.addressDictionary[@"FormattedAddressLines"];
			// 将详细地址拼接成一个字符串
			NSMutableString* address = [[NSMutableString alloc] init];
			for(int i = 0 ; i < addrArray.count ; i ++)
			{
				[address appendString:addrArray[i]];
			}
			// 创建MKPointAnnotation对象——代表一个锚点
			MKPointAnnotation  *annotation = [[MKPointAnnotation alloc] init];
			annotation.title = placemark.name;
			annotation.subtitle = address;
			annotation.coordinate = coord;
			// 添加锚点
			[self.mapView addAnnotation:annotation];
		}
	}];
}
@end
