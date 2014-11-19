//
//  FKViewController.m
//  UIApplicationTest
//
//  Created by yeeku on 13-10-23.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()
{
	UIApplication* app;
}
@end

@implementation FKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	app = [UIApplication sharedApplication];
}
- (IBAction)sendSMs:(id)sender
{
	// 打开sms:开头的URL代表发送短信，使用sms:或sms://前缀都行
	[app openURL:[NSURL URLWithString:@"sms:10010"]];
}
- (IBAction)callPhone:(id)sender
{
	// 打开tel:开头的URL代表拨打电话，使用tel:或tel://前缀都行
	[app openURL:[NSURL URLWithString:@"tel:10010"]];
}
- (IBAction)webViewCallPhone:(id)sender
{
	UIWebView*callWebview =[[UIWebView alloc] init];
	// 使用UIWebView加载tel:开头的URL代表拨打电话，而且电话结束后返回本应用
	// 使用tel:或tel://前缀都行
	NSURL *telURL =[NSURL URLWithString:@"tel:10010"];
	[callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
	// 将UIWebView添加到视图控制器管理的view中
	[self.view addSubview:callWebview];
}
- (IBAction)promptCallPhone:(id)sender
{
	// 打开telprompt:开头的URL代表拨打电话，使用telprompt:或telprompt://前缀都行
	[app openURL:[NSURL URLWithString:@"telprompt:10010"]];
}
- (IBAction)sendMail:(id)sender
{
	// 打开mailto:开头的URL代表发送短信，此处使用mailto://或mailto:前缀都行
	[app openURL:[NSURL URLWithString:@"mailto:spring_test@sina.com"]];
}
- (IBAction)browserSite:(id)sender
{
	// 打开http:开头的URL代表使用默认的浏览器浏览指定网站，使用http:或http://前缀都行
	[app openURL:[NSURL URLWithString:@"http:www.crazyit.org"]];
}
@end
