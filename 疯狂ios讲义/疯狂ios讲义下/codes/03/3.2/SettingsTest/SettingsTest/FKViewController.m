//
//  FKViewController.m
//  SettingsTest
//
//  Created by yeeku on 13-8-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@implementation FKViewController

- (void) refreshFields
{
	// 获取该应用的NSUserDefaults
	NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
	// 获取NSUserDefaults中保存的值来更新界面上UI控件的值
	self.nameLabel.text = [defaults stringForKey:@"name"];
	self.passLabel.text = [defaults stringForKey:@"password"];
	self.musicOnLabel.text = [defaults stringForKey:@"musicOn"]?@"开启":@"关闭";
	self.speedLabel.text = [defaults stringForKey:@"gameSpeed"];
	self.raceLabel.text = [defaults stringForKey:@"race"];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 获取该应用的UIApplication对象
	UIApplication *app = [UIApplication sharedApplication];
	// 注册让self监视app发出的UIApplicationWillEnterForegroundNotification通知
	// 该通知发生时，激发appWillEnterFore方法
	[[NSNotificationCenter defaultCenter] addObserver:self
		selector:@selector(appWillEnterFore:)
		name:UIApplicationWillEnterForegroundNotification
		object:app];
}
// 当该视图控制器显示时将会自动调用该方法
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	// 使用NSUserDefaults中的参数更新界面上的UI控件的值
	[self refreshFields];
}
// 接收到通知时激发该方法
- (void) appWillEnterFore:(NSNotification*) notification
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	// 保存所有修改
	[defaults synchronize];
	// 使用NSUserDefaults中的参数更新界面上的UI控件的值
	[self refreshFields];
}
@end
