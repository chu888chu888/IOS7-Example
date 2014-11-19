//
//  FKViewController.m
//  AFNetworkingAccess
//
//  Created by yeeku on 13-10-3.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "ASIHTTPRequest.h"

@interface FKViewController ()

@end
@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (IBAction)accessSecret:(id)sender
{
	// 使用AFHTTPRequestOperationManager发送GET请求
	NSURL *url = [NSURL URLWithString:
		@"http://192.168.1.88:8888/ASIHTTPServer/secret.jsp"];
	// 以指定URL创建ASIHTTPRequest对象
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
	// 发送同步请求
	[request startSynchronous];
	NSError *error = [request error];
	// 如果发送请求、获取服务器响应没有错误
	if (!error)
	{
		[self.showView loadHTMLString:request.responseString baseURL:nil];
		// 如果需要获取二进制数据，则可使用responseData方法来获取
		NSData* data = request.responseData;
	}
}
@end
