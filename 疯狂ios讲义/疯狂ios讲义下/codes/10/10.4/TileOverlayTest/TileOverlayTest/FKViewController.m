//
//  FKViewController.m
//  OverlayTestx
//
//  Created by yeeku on 13-10-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//
#import <MapKit/MapKit.h>
#import "FKViewController.h"

@interface FKViewController () <MKMapViewDelegate>
@property (nonatomic, strong) MKMapView* mapView;
@end
@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
	self.mapView.zoomEnabled = YES;
	// 设置地图可滚动
	self.mapView.scrollEnabled = YES;
	// 设置地图不可旋转
	self.mapView.rotateEnabled = NO;
	// 设置地图显示用户位置
	self.mapView.showsUserLocation = YES;
	[self.view addSubview:self.mapView];
	[self locateToLatitude:23.126272 longitude:113.395568];
	// 创建一个手势处理器，用于检测、处理长按手势
	UILongPressGestureRecognizer* gesture = [[UILongPressGestureRecognizer
		alloc]initWithTarget:self action:@selector(longPress:)];
	[self.mapView addGestureRecognizer:gesture];
	self.mapView.delegate = self;
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
- (void) longPress:(UILongPressGestureRecognizer*)gesture
{
	NSURL* url = [[NSBundle mainBundle]
		URLForResource:@"fkit" withExtension:@"png"];
	// 创建MKTileOverlay对象，该对象代表覆盖层
	MKTileOverlay* overlay = [[MKTileOverlay alloc]
		initWithURLTemplate:[url description]];
	// 添加MKOverlay
	[self.mapView addOverlay:overlay];
}
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView
	rendererForOverlay:(id<MKOverlay>)overlay
{
	// 创建MKTileOverlayRenderer对象
	MKTileOverlayRenderer* renderer = [[MKTileOverlayRenderer alloc]
		initWithOverlay:(MKTileOverlay*)overlay];
	// 设置MKTileOverlayRenderer的透明度为0.3
	renderer.alpha = 0.3;
	return renderer;
}
@end
