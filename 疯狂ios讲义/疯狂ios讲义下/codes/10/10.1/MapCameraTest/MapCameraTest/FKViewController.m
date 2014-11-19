//
//  FKViewController.m
//  OverlayTestx
//
//  Created by yeeku on 13-10-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//
#import <MapKit/MapKit.h>
#import "FKViewController.h"

@interface FKViewController ()
@property (nonatomic, strong) MKMapView* mapView;
@end

@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
	self.mapView.mapType = MKMapTypeStandard;
	self.mapView.zoomEnabled = YES;
	// 设置地图可滚动
	self.mapView.scrollEnabled = YES;
	// 设置地图不可旋转
	self.mapView.rotateEnabled = NO;
	[self.view addSubview:self.mapView];
	self.mapView.showsUserLocation = YES;
	[self locateToLatitude:23.126272 longitude:113.395568];
	CLLocationCoordinate2D to = {23.126272 , 113.395568};
	CLLocationCoordinate2D from = {22.826272 , 113.295568};
	MKMapCamera* camera = [MKMapCamera cameraLookingAtCenterCoordinate:to
		fromEyeCoordinate:from eyeAltitude:70];
	self.mapView.camera = camera;
}
- (void)locateToLatitude:(CGFloat)latitude longitude:(CGFloat)longitude
{
	// 设置地图中心的经、纬度
	CLLocationCoordinate2D center = {latitude , longitude};
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
@end
