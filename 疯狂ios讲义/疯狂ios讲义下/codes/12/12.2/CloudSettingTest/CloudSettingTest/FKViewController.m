//
//  FKViewController.m
//  SettingsTest
//
//  Created by yeeku on 13-11-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 使用NSNotificationCenter监听应用进入后台的通知
	[[NSNotificationCenter defaultCenter] addObserver:self
		selector:@selector(enterBack:)
		name:UIApplicationDidEnterBackgroundNotification
		object:[UIApplication sharedApplication]];
}
// 当该视图控制器显示时将会自动调用该方法
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	// 获取该应用的NSUbiquitousKeyValueStore
	NSUbiquitousKeyValueStore* defaults = [NSUbiquitousKeyValueStore defaultStore];
	// 使用NSNotificationCenter监听NSUbiquitousKeyValueStore获取到数据的通知
	// 当NSUbiquitousKeyValueStore从云端获取数据后，程序调用refreshFields方法。
	[[NSNotificationCenter defaultCenter] addObserver:self
		selector:@selector(refreshFields)
		name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification
		object:defaults];
	// 让NSUbiquitousKeyValueStore从云端获取数据
	[defaults stringForKey:@"name"];
}
- (void)refreshFields
{
	NSLog(@"~~~~从云端获取了key-value对~~~~");
	// 获取该应用的NSUbiquitousKeyValueStore
	NSUbiquitousKeyValueStore* defaults = [NSUbiquitousKeyValueStore defaultStore];
	// 获取NSUbiquitousKeyValueStore中保存的值来更新界面上UI控件的值
	self.nameField.text = [defaults stringForKey:@"name"];
	self.passField.text = [defaults stringForKey:@"password"];
	self.musicSwitch.on = [defaults boolForKey:@"musicOn"];
	self.speedSlider.value = [[defaults objectForKey:@"speed"] floatValue];
}
- (void)enterBack:(NSNotification*)notification
{
	// 获取该应用的NSUbiquitousKeyValueStore
	NSUbiquitousKeyValueStore* defaults = [NSUbiquitousKeyValueStore defaultStore];
	// 将用户输入的用户名、密码设置到NSUbiquitousKeyValueStore中
	[defaults setString:self.nameField.text forKey:@"name"];
	[defaults setString:self.passField.text forKey:@"password"];
	// 保存所有修改
	[defaults synchronize];
	NSLog(@"~~~~保存~~~~");
}
- (IBAction)musicChanged:(id)sender
{
	NSUbiquitousKeyValueStore* defaults = [NSUbiquitousKeyValueStore defaultStore];
	// 将lightSwitch控件的值设置到NSUbiquitousKeyValueStore中
	[defaults setBool:self.musicSwitch.on forKey:@"musicOn"];
}
- (IBAction)speedChanged:(id)sender
{
	NSUbiquitousKeyValueStore* defaults = [NSUbiquitousKeyValueStore defaultStore];
	// 将speedSlider控件的值设置到NSUbiquitousKeyValueStore中
	[defaults setObject: [NSNumber numberWithFloat:self.speedSlider.value]
		forKey:@"speed"];
}
@end
