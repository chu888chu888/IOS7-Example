//
//  FKViewController.m
//  GeocoderTest
//
//  Created by yeeku on 13-10-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "FKViewController.h"

@interface FKViewController ()
@property (strong, nonatomic) IBOutlet UITextField *addrField;
@property (strong, nonatomic) IBOutlet UITextField *longitudeField;
@property (strong, nonatomic) IBOutlet UITextField *latitudeField;
@property (strong, nonatomic) IBOutlet UITextView *resultView;
- (IBAction)encodeTapped:(id)sender;
- (IBAction)reverseTapped:(id)sender;
@property (strong, nonatomic) CLGeocoder* geocoder;
@end
@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 创建地址解析器
	self.geocoder = [[CLGeocoder alloc] init];
}
- (IBAction)encodeTapped:(id)sender
{
	// 获取用户输入的地址字符串
	NSString* addr = self.addrField.text;
	if(addr != nil && addr.length > 0)
	{
		[self.geocoder geocodeAddressString:addr
			completionHandler: ^(NSArray *placemarks, NSError *error)
		{
			// 如果解析结果的集合元素的个数大于1，表明解析得到了经度、纬度信息
			if (placemarks.count > 0)
			{
				// 只处理第一个解析结果，实际项目中可使用列表让用户选择
				CLPlacemark* placemark = placemarks[0];
				CLLocation* location = placemark.location;
				self.resultView.text = [NSString stringWithFormat:
					@"%@的经度为：%g，纬度为：%g" , addr ,
					location.coordinate.longitude ,
					location.coordinate.latitude ];
			}
			// 没有得到解析结果。
			else
			{
				// 使用UIAlertView提醒用户
				[[[UIAlertView alloc] initWithTitle:@"提醒"
					message:@"您输入的地址无法解析" delegate:nil
					cancelButtonTitle:@"确定" otherButtonTitles: nil]
					show];
			}
		}];
	}
}
- (IBAction)reverseTapped:(id)sender
{
	NSString* longitudeStr = self.longitudeField.text;
	NSString* latitudeStr = self.latitudeField.text;
	if(longitudeStr != nil && longitudeStr.length > 0
	   && latitudeStr != nil && latitudeStr.length > 0)
	{
		// 将用户输入的经度、纬度封装成CLLocation对象
		CLLocation* location = [[CLLocation alloc]
			initWithLatitude:[latitudeStr floatValue]
			longitude:[longitudeStr floatValue]];
		[self.geocoder reverseGeocodeLocation:location completionHandler:
			^(NSArray *placemarks, NSError *error)
		{
			// 如果解析结果的集合元素的个数大于1，表明解析得到了经度、纬度信息
			if (placemarks.count > 0)
			{
				// 只处理第一个解析结果，实际项目可使用列表让用户选择
				CLPlacemark* placemark = placemarks[0];
				// 获取详细地址信息
				NSArray* addrArray = [placemark.addressDictionary
					objectForKey:@"FormattedAddressLines"];
				// 将详细地址拼接成一个字符串
				NSMutableString* addr = [[NSMutableString alloc] init];
				for(int i = 0 ; i < addrArray.count ; i ++)
				{
					[addr appendString:addrArray[i]];
				}
				self.resultView.text = [NSString stringWithFormat:
					@"经度：%g，纬度：%g的地址为：%@" ,
					location.coordinate.longitude ,
					location.coordinate.latitude , addr];
			}
			// 没有得到解析结果。
			else
			{
				// 使用UIAlertView提醒用户
				[[[UIAlertView alloc] initWithTitle:@"提醒"
					message:@"您输入的地址无法解析" delegate:nil
					cancelButtonTitle:@"确定" otherButtonTitles: nil]
				show];
			}
		}];
	}
}
@end
