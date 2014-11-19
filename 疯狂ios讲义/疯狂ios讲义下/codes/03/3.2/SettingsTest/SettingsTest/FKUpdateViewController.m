//
//  FKUpdateViewController.m
//  SettingsTest
//
//  Created by yeeku on 13-8-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKUpdateViewController.h"

@implementation FKUpdateViewController
- (void) refreshFields
{
	// 获取该应用的NSUserDefaults	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	// 获取NSUserDefaults中保存的值来更新界面上UI控件的值
	self.soundSlider.value = [[defaults objectForKey:@"music"] floatValue];;
	self.lightSwitch.on = [defaults boolForKey:@"lightOn"];
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
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	// 使用NSUserDefaults中的参数更新界面上的UI控件的值
	[self refreshFields];
}
- (IBAction)soundChanged:(id)sender {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	// 将soundSlider控件的值设置到NSUserDefaults中
	[defaults setFloat:self.soundSlider.value forKey:@"music"];
	// 保存所有修改
	[defaults synchronize];
}

- (IBAction)lightChanged:(id)sender {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	// 将lightSwitch控件的值设置到NSUserDefaults中	
	[defaults setBool:self.lightSwitch.on forKey:@"lightOn"];
	// 保存所有修改
	[defaults synchronize];
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
