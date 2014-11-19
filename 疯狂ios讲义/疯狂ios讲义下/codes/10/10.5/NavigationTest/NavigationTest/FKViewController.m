//
//  FKViewController.m
//  NavigationTest
//
//  Created by yeeku on 13-10-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "FKViewController.h"

@interface FKViewController () <MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *destField;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
// 定义一个CLGeocoder对象，该对象负责对用户输入的地址进行解析
@property (nonatomic, strong) CLGeocoder* geocoder;
// 定义一个变量来保存导航路径
@property (nonatomic, strong) MKPolyline* naviPath;
- (IBAction)navTapped:(id)sender;
- (IBAction)finishEdit:(id)sender;
@end
@implementation FKViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
	self.geocoder = [[CLGeocoder alloc] init];
	self.mapView.mapType = MKMapTypeStandard;
	self.mapView.delegate = self;
	self.mapView.zoomEnabled = YES;
	// 设置地图可滚动
	self.mapView.scrollEnabled = YES;
	// 设置地图不可旋转
	self.mapView.rotateEnabled = NO;
	self.mapView.showsUserLocation = YES;
	[self locateToLatitude:23.126272 longitude:113.395568];
}
- (IBAction)navTapped:(id)sender
{
	// 获取用户输入的目标地址
	NSString* destStr = self.destField.text;
	if (destStr != nil && destStr.length > 0)
	{
		// 解析目标地址，获取实际的经度、维度信息
		[self.geocoder geocodeAddressString:destStr completionHandler:
			^void (NSArray *placemarks, NSError *error)
		{
			/* 实际应用中，此处如果发现placemarks集合包含多个元素，即表明根据该地址字符串
			 检索到多个地址值，那么应该显示一个列表框让用户选择目标地址。
			 此处为了简化该示例，直接使用第一个地址值作为目标地址。
			*/
			if(placemarks.count > 0)
			{
				// 删除上一次的导航路径
				[self.mapView removeOverlay:self.naviPath];
				// 创建MKDirectionsRequest对象，作为查询导航线路的请求
				MKDirectionsRequest* request = [[MKDirectionsRequest alloc] init];
				// 将当前位置设置为导航的起始点
				request.source = [MKMapItem mapItemForCurrentLocation];
				// 获取地址解析得到的第一个地址值
				CLPlacemark* clPlacemark = placemarks[0];
				MKPlacemark* mkPlacemark = [[MKPlacemark alloc]
					initWithPlacemark:clPlacemark];
				// 将解析得到的目标地址设置为导航的结束点
				request.destination = [[MKMapItem alloc]
					initWithPlacemark:mkPlacemark];
				// 以MKDirectionsRequest作为参数，创建MKDirections对象
				MKDirections* directions = [[MKDirections alloc]
					initWithRequest:request];
				[directions calculateDirectionsWithCompletionHandler:
					^void (MKDirectionsResponse *response, NSError *error)
					{
					  	// 获取查询返回的第一条线路
						MKRoute* route = response.routes[0];
						// 保存检索得到的导航信息
						self.naviPath = route.polyline;
						// 将self.naviPath（MKPolyline对象）添加成覆盖层
						[self.mapView addOverlay:self.naviPath
							level:MKOverlayLevelAboveLabels];
				}];
			}
			else
			{
				// 使用提示框提醒用户输入的地址无效
				[[[UIAlertView alloc] initWithTitle:@"提醒"
					message:@"无法定位您输入的地址，请重新输入！" delegate:nil
					cancelButtonTitle:@"确定" otherButtonTitles: nil]
				show];
			}
		}];
	}
}
- (IBAction)finishEdit:(id)sender
{
	// 关闭文本框关联的虚拟键盘
	[sender resignFirstResponder];
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
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView
	rendererForOverlay:(id<MKOverlay>)overlay
{
	// 创建MKPolylineRenderer对象，该对象负责绘制MKPolyline覆盖层控件
	MKPolylineRenderer* renderer = [[MKPolylineRenderer alloc]
		initWithPolyline:overlay];
	// 设置MKPolylineRenderer对象的线条颜色
	renderer.strokeColor = [UIColor blueColor];
	// 设置MKPolylineRenderer的线宽
	renderer.lineWidth = 2;
	return renderer;
}
@end
