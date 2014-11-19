//
//  FKViewController.m
//  AddressLocMap
//
//  Created by yeeku on 13-10-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "FKViewController.h"

@interface FKViewController () <UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong,nonatomic) CLGeocoder *geocoder;
@end
@implementation FKViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
	self.geocoder = [[CLGeocoder alloc]init];
	// 设置地图可缩放
	self.mapView.zoomEnabled = YES;
	// 设置地图可滚动
	self.mapView.scrollEnabled = YES;
	// 设置地图不可旋转
	self.mapView.rotateEnabled = NO;
	// 设置显示用户当前位置
	self.mapView.showsUserLocation = YES;
	// 设置地图的类型
	self.mapView.mapType = MKMapTypeStandard;
	// 为了方便测试，直接设置搜索框的文本内容
	self.searchBar.text =@"沣宏大厦";
	self.searchBar.delegate = self;
}
// 当用户单击虚拟键盘上的“搜索”按钮时激发该方法
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	// 调用searchBar方法进行搜索
	[self doSearch:searchBar];
}
// 当用户单击“取消”按钮时激发该方法
// 由于我们重定义了该控件的外观——将取消按钮的文本改成了“搜索”，因此单击取消按钮也执行搜索
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	// 调用searchBar方法进行搜索
	[self doSearch:searchBar];
}
// 执行搜索的方法
- (void)doSearch:(UISearchBar *)searchBar
{
	// 关闭searchBar关联的虚拟键盘
	[self.searchBar resignFirstResponder];
	NSString* searchText = self.searchBar.text;
	if(searchText != nil && searchText.length > 0)
	{
		[self locateAt:searchText];
	}
}
// 当用户在搜索框内输入文本时激发该方法
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
	// 显示取消按钮
	searchBar.showsCancelButton = YES;
	// 通过遍历找到该搜索框内的取消按钮，并将取消按钮的文本设为“搜索”
	for (id cc in [searchBar.subviews[0] subviews])
	{
		if ([cc isKindOfClass:[UIButton class]])
		{
			UIButton *button = (UIButton *)cc;
			[button setTitle:@"搜索" forState:UIControlStateNormal];
		}
	}
}
// 将字符串地址转换为经度、纬度信息，并执行定位
-(void)locateAt:(NSString*)address
{
	[self.geocoder geocodeAddressString:address completionHandler:
	 	^(NSArray *placemarks, NSError *error)
		{
			if ([placemarks count] > 0 && error == nil)
			{
				NSLog(@"搜索到匹配%d条地址数据.", placemarks.count);
				// 处理第一个地址
				CLPlacemark * placemark = [placemarks objectAtIndex:0];
				NSLog(@"经度 = :%f", placemark.location.coordinate.longitude);
				NSLog(@"纬度 = :%f", placemark.location.coordinate.latitude);
				NSLog(@"国家 = %@", placemark.country);
				NSLog(@"邮编 = %@", placemark.postalCode);
				NSLog(@"位置 = %@", placemark.locality);
				// 设置地图显示的范围
				MKCoordinateSpan span;
				// 地图显示范围越小，细节越清楚
				span.latitudeDelta = 0.01;
				span.longitudeDelta = 0.01;
				MKCoordinateRegion region = {placemark.location.coordinate,span};
				// 设置地图中心位置为搜索到的位置
				[self.mapView setRegion:region];  // ①
				// 创建一个MKPointAnnotation，该对象将作为地图锚点
				MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
				// 设置地图锚点的坐标
				point.coordinate = placemark.location.coordinate;
				// 设置地图锚点的标题
				point.title = placemark.name;
				// 设置地图锚点的副标题
				point.subtitle = [NSString stringWithFormat:@"%@-%@-%@-%@",
					placemark.country , placemark.administrativeArea,
					placemark.locality , placemark.subLocality];
				// 将地图锚点添加到地图上
				[self.mapView addAnnotation:point];
				// 选中指定锚点
				[self.mapView selectAnnotation:point animated:YES];
			}
			else
			{
				NSLog(@"没有搜索到匹配数据");
			}
		}];
}
@end
