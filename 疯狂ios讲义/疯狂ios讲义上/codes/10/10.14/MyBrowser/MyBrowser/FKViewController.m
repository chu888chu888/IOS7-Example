//
//  FKViewController.m
//  MyBrowser
//
//  Created by yeeku on 13-6-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
UIActivityIndicatorView* activityIndicator;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 设置自动缩放网页以是适应该控件。
	self.webView.scalesPageToFit = YES;
	// 为UIWebView控件设置委托
	self.webView.delegate = self;
	// 创建一个UIActivityIndicatorView控件
	activityIndicator = [[UIActivityIndicatorView alloc]
		initWithFrame : CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
	// 控制UIActivityIndicatorView显示在当前View的中央。
	[activityIndicator setCenter: self.view.center] ;
	activityIndicator.activityIndicatorViewStyle
		= UIActivityIndicatorViewStyleWhiteLarge;
	[self.view addSubview : activityIndicator];
	// 隐藏activityIndicator控件
	activityIndicator.hidden = YES;
	[self goClicked:nil];
}
// 当UIWebView开始加载时激发该方法
- (void)webViewDidStartLoad:(UIWebView *)webView
{
	// 显示activityIndicator控件
	activityIndicator.hidden = NO;
	// 启动activityIndicator控件的转动
	[activityIndicator startAnimating] ;
}
// 当UIWebView加载完成时激发该方法
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	// 停止activityIndicator控件的转动
	[activityIndicator stopAnimating];
	// 隐藏activityIndicator控件
	activityIndicator.hidden = YES;
}
// 当UIWebView加载失败时激发该方法
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	// 使用UIAlertView显示错误信息
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
		message:[error localizedDescription]
		delegate:nil
		cancelButtonTitle:nil
		otherButtonTitles:@"确定", nil];
	[alert show];
}
- (IBAction)goClicked:(id)sender {
	[self.addr resignFirstResponder];
	// 获取用户输入的字符串
	NSString* reqAddr = self.addr.text;
	// 如果reqAddr不以http://开头，为该用户输入的网址添加http://前缀
	if (![reqAddr hasPrefix:@"http://"]) {
		reqAddr = [NSString stringWithFormat:@"http://%@" , reqAddr];
		self.addr.text = reqAddr;
	}
	NSURLRequest* request = [NSURLRequest requestWithURL:
		[NSURL URLWithString:reqAddr]];
	// 加载指定URL对应的网址
	[self.webView loadRequest:request];
}
@end
