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
	// 获取长按点的坐标
	CGPoint pos = [gesture locationInView:self.mapView];
	// 将长按点的坐标转换为经度、维度值
	CLLocationCoordinate2D coord = [self.mapView convertPoint:pos
		toCoordinateFromView:self.mapView];
	// 创建MKCircle对象，该对象代表覆盖层
	MKCircle* circle = [MKCircle circleWithCenterCoordinate:coord radius:100];
	// 添加MKOverlay
	[self.mapView addOverlay:circle level:MKOverlayLevelAboveLabels];
}
// MKMapViewDelegate协议中的方法，该方法返回的MKOverlayRenderer负责绘制覆盖层控件
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView
	rendererForOverlay:(id<MKOverlay>)overlay
{
	MKCircle * circle = (MKCircle*)overlay;
	// 创建一个MKCircleRenderer对象
	MKCircleRenderer* render = [[MKCircleRenderer alloc] initWithCircle:circle];
	// 设置MKCircleRenderer的透明度
	render.alpha = 0.3;
	// 设置MKCircleRenderer的填充颜色和边框颜色
	render.fillColor = [UIColor blueColor];
	render.strokeColor = [UIColor redColor];
	return render;
}
@end
