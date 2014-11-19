//
//  FKViewController.m
//  NetStatus
//
//  Created by yeeku on 13-9-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "Reachability.h"

@implementation FKViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
}
- (IBAction)testNetStatus:(id)sender
{
	NSString* site = self.siteField.text;
	// 创建访问指定站点的Reachability
	Reachability* reach = [Reachability reachabilityWithHostName:site];
	// 判断该设备的网络状态
	switch ([reach currentReachabilityStatus])
	{
		// 不能访问
		case NotReachable:
			[self showAlert:[NSString stringWithFormat:@"不能访问%@" , site]];
			break;
		// 使用3G/4G网络
		case ReachableViaWWAN:
			[self showAlert:[NSString stringWithFormat:@"使用3G/4G网络访问%@" , site]];
			break;
		// 使用WiFi网络
		case ReachableViaWiFi:
			[self showAlert:[NSString stringWithFormat:@"使用WiFi网络访问%@" , site]];
			break;
	}
}

- (IBAction)testWifi:(id)sender
{
	if([[Reachability reachabilityForLocalWiFi]
		currentReachabilityStatus] != NotReachable)
	{
		[self showAlert:@"WIFI网络已经连接"];
	}
	else
	{
		[self showAlert:@"WIFI网络不可用。"];
	}
}

- (IBAction)testInternet:(id)sender
{
	if([[Reachability reachabilityForInternetConnection]
		currentReachabilityStatus] != NotReachable)
	{
		[self showAlert:@"3G/4G网络已经连接"];
	}
	else
	{
		[self showAlert:@"3G/4G网络不可用。"];
	}
}

- (IBAction)finishEdit:(id)sender {
	[sender resignFirstResponder];
}
- (void) showAlert:(NSString*)msg
{
	UIAlertView* alert = [[UIAlertView alloc]
		initWithTitle:@"网络状态" message:msg delegate:nil
		cancelButtonTitle:@"确定" otherButtonTitles:nil];
	[alert show];
}
@end
