//
//  FKViewController.m
//  ApplicationNotiTest
//
//  Created by yeeku on 13-11-4.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 监听UIApplication的UIApplicationDidFinishLaunchingNotification通知
	[[NSNotificationCenter defaultCenter] addObserver:self
		selector:@selector(launch:)
		name:UIApplicationDidFinishLaunchingNotification
		object:[UIApplication sharedApplication]];
	// 监听UIApplication的UIApplicationDidEnterBackgroundNotification通知
	[[NSNotificationCenter defaultCenter] addObserver:self
		selector:@selector(back:)
		name:UIApplicationDidEnterBackgroundNotification
		object:[UIApplication sharedApplication]];
	// 监听UIApplication的UIApplicationWillEnterForegroundNotification通知
	[[NSNotificationCenter defaultCenter] addObserver:self
		selector:@selector(fore:)
		name:UIApplicationWillEnterForegroundNotification
		object:[UIApplication sharedApplication]];
}
- (void) launch:(NSNotification*) notification
{
	self.showLabel.text = [NSString stringWithFormat:@"应用程序加载完成!"];
}
- (void) back:(NSNotification*) notification
{
	self.showLabel.text = [NSString stringWithFormat:@"%@\n应用程序进入后台!"
		, self.showLabel.text];
}
- (void) fore:(NSNotification*) notification
{
	self.showLabel.text = [NSString stringWithFormat:@"%@\n应用程序进入前台!"
		, self.showLabel.text];
}
@end
