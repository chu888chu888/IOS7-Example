//
//  FKViewController.m
//  AFNetworkingAccess
//
//  Created by yeeku on 13-10-3.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "FKAppDelegate.h"

@interface FKViewController ()
{
	FKAppDelegate* appDelegate;
}
@end
@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	appDelegate = [UIApplication sharedApplication].delegate;
}
- (IBAction)accessSecret:(id)sender
{
	// 使用AFHTTPRequestOperationManager发送GET请求
	[appDelegate.manager
		GET:@"http://192.168.1.88:8888/AFNetworkingServer/secret.jsp"
		parameters:nil // 指定无需请求参数
		// 获取服务器响应成功时激发的代码块
		success:^(AFHTTPRequestOperation *operation, id responseObject)
		{
			// 当使用HTTP响应解析器时，服务器响应数据被封装在NSData中
			// 此处将NSData转换成NSString、并使用UIWebView将响应字符串显示出来
			[self.showView loadHTMLString:[[NSString alloc] initWithData:
				responseObject encoding:NSUTF8StringEncoding] baseURL:nil];
		}
		// 获取服务器响应失败时激发的代码块
	 	failure:^(AFHTTPRequestOperation *operation, NSError *error)
		{
			NSLog(@"获取服务器响应出错！");
		}];
}
@end
