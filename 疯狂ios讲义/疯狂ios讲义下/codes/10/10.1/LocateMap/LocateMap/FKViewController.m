//
//  FKViewController.m
//  LocateMap
//
//  Created by yeeku on 13-10-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "FKViewController.h"

@interface FKViewController () <MKMapViewDelegate>
@end
@implementation FKViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
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
	// 为MKMapView设置delegate
	self.mapView.delegate = self;
	// 调用自己实现的方法设置地图的显示位置和显示区域
	[self locateToLatitude:23.126272 longitude:113.395568];
	NSLog(@"用户当前是否位于地图中：%d" , self.mapView.userLocationVisible);
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
	// 也可以使用如下方式设置经、纬度
	//	center.latitude = latitude;
	//	center.longitude = longitude;
	// 设置地图显示的范围，
	MKCoordinateSpan span;
	// 地图显示范围越小，细节越清楚
	span.latitudeDelta = 0.01;
	span.longitudeDelta = 0.01;
	// 创建MKCoordinateRegion对象，该对象代表了地图的显示中心和显示范围。
	MKCoordinateRegion region = {center,span};
	// 设置当前地图的显示中心和显示范围
	[self.mapView setRegion:region animated:YES];
}
// MKMapViewDelegate协议中的方法，当MKMapView显示区域将要发生改变时激发该方法
- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
	NSLog(@"地图控件的显示区域将要发生改变！");
}
// MKMapViewDelegate协议中的方法，当MKMapView显示区域改变完成时激发该方法
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
	NSLog(@"地图控件的显示区域完成了改变！");
}
// MKMapViewDelegate协议中的方法，当MKMapView开始加载数据时激发该方法
- (void) mapViewWillStartLoadingMap:(MKMapView *)mapView
{
	NSLog(@"地图控件开始加载地图数据！");
}
// MKMapViewDelegate协议中的方法，当MKMapView加载数据完成时激发该方法
- (void) mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
	NSLog(@"地图控件加载地图数据完成！");
}
// MKMapViewDelegate协议中的方法，当MKMapView加载数据失败时激发该方法
- (void) mapViewDidFailLoadingMap:(MKMapView *)mapView
	withError:(NSError *)error
{
	NSLog(@"地图控件加载地图数据发生错误，错误信息 %@！" , error);
}
// MKMapViewDelegate协议中的方法，当MKMapView开始渲染地图时激发该方法
- (void) mapViewWillStartRenderingMap:(MKMapView *)mapView
{
	NSLog(@"地图控件开始渲染地图！");
}
// MKMapViewDelegate协议中的方法，当MKMapView渲染地图完成时激发该方法
- (void) mapViewDidFinishRenderingMap:(MKMapView *)mapView
	fullyRendered:(BOOL)fullyRendered
{
	NSLog(@"地图控件渲染地图完成！");
}
@end
