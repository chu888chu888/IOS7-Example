//
//  FKViewController.m
//  UIWebViewTest
//
//  Created by yeeku on 13-6-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	NSMutableString* sb = [[NSMutableString alloc] init];
	// 拼接一段HTML代码
	[sb appendString:@"<html>"];
	[sb appendString:@"<head>"];
	[sb appendString:@"<title> 欢迎您 </title>"];
	[sb appendString:@"</head>"];
	[sb appendString:@"<body>"];
	[sb appendString:@"<h2> 欢迎您访问<a href=\"http://www.crazyit.org\">"];
	[sb appendString:@"疯狂Java联盟</a></h2>"];
	// HTML代码中支持JavaScript脚本
	[sb appendString:@"<script language='javascript'>"];
	[sb appendString:@"alert('欢迎使用UIWebView');</script>"];
	[sb appendString:@"</body>"];
	[sb appendString:@"</html>"];
	// 加载、并显示HTML代码
	[self.webView loadHTMLString:sb
		baseURL:[NSURL URLWithString:@"http://www.fkit.org"]];
}
@end
