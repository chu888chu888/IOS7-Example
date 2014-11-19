//
//  FKLoginController.m
//  AFNetworkingAccess
//
//  Created by yeeku on 13-10-4.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKLoginController.h"
#import "ASIHTTPRequest.h"

@interface FKLoginController () <ASIHTTPRequestDelegate>
@property (nonatomic , strong) NSOperationQueue* queue;
@end
@implementation FKLoginController
- (void)viewDidLoad
{
	[super viewDidLoad];
}
// 使用delegata处理回调
//- (IBAction)loginBnClicked:(id)sender
//{
//	// 获取用户输入的用户名和密码
//	NSString* name = self.nameField.text;
//	NSString* pass = self.passField.text;
//	if(name != nil && name.length > 0
//	   && pass != nil && pass.length > 0)
//	{
//		NSString* urlStr = [NSString stringWithFormat:
//			@"http://192.168.1.88:8888/ASIHTTPServer/login.jsp?name=%@&pass=%@",
//			name , pass];
//		NSURL *url = [NSURL URLWithString:urlStr];
//		// 以指定URL创建ASIHTTPRequest对象
//		ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//		// 将该视图控制器对象本身设为该ASIHTTPRequest的delegate
//		request.delegate = self;
//		// 发送异步请求
//		[request startAsynchronous];
//	}
//}
// 使用回调代码块处理回调
//- (IBAction)loginBnClicked:(id)sender
//{
//	// 获取用户输入的用户名和密码
//	NSString* name = self.nameField.text;
//	NSString* pass = self.passField.text;
//	if(name != nil && name.length > 0
//	   && pass != nil && pass.length > 0)
//	{
//		NSString* urlStr = [NSString stringWithFormat:
//			@"http://192.168.1.88:8888/ASIHTTPServer/login.jsp?name=%@&pass=%@",
//			name , pass];
//		NSURL *url = [NSURL URLWithString:urlStr];
//		// 以指定的URL对创建ASIHTTPRequest对象，并将该对象设为代码块变量。
//		__block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//		// 设置发送请求、获取服务器响应完成时激发的代码块
//		[request setCompletionBlock:^{
//			NSString *responseString = [request responseString];
//			[[[UIAlertView alloc] initWithTitle:@"登录结果"
//				message:responseString
//				delegate:self cancelButtonTitle:@"确定"
//				otherButtonTitles:nil]
//			show];
//		}];
//		// 设置发送请求失败时激发该方法
//		[request setFailedBlock:^{
//			NSError *error = request.error;
//			NSLog(@"获取服务器响应出现错误%@" , error);
//		}];
//		// 发送异步请求
//		[request startAsynchronous];
//	}
//}
// 使用NSOperationQueue管理ASIHTTPRequest
- (IBAction)loginBnClicked:(id)sender
{
	// 如果self.queue还未初始化，创建NSOperationQueue。
	if (!self.queue)
	{
		self.queue = [[NSOperationQueue alloc] init];
	}
	// 获取用户输入的用户名和密码
	NSString* name = self.nameField.text;
	NSString* pass = self.passField.text;
	if(name != nil && name.length > 0
	   && pass != nil && pass.length > 0)
	{
		NSString* urlStr = [NSString stringWithFormat:
			@"http://192.168.1.88:8888/ASIHTTPServer/login.jsp?name=%@&pass=%@",
			name , pass];
		NSURL *url = [NSURL URLWithString:urlStr];
		// 以指定URL创建ASIHTTPRequest对象
		ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
		// 将该视图控制器对象本身设为该ASIHTTPRequest的delegate
		request.delegate = self;
		// 为request设置自定义的回调处理方法，覆盖默认的回调处理方法
		[request setDidFinishSelector:@selector(requestDone:)];
		[request setDidFailSelector:@selector(requestWentWrong:)];
		// 将ASIHTTPRequest添加到NSOperationQueue中即可
		[self.queue addOperation:request];
	}
}

// 发送请求、获取服务器响应完成时激发该方法
- (void)requestFinished:(ASIHTTPRequest *)request
{
	NSString *responseString = [request responseString];
	[[[UIAlertView alloc] initWithTitle:@"登录结果"
		message:responseString
		delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil]
	 	show];
}
// 发送请求失败时激发该方法
- (void)requestFailed:(ASIHTTPRequest *)request
{
	NSError *error = request.error;
	NSLog(@"获取服务器响应出现错误%@" , error);
}
		 
 // 定义自定义的发送请求、获取服务器响应完成时激发该方法
 - (void)requestDone:(ASIHTTPRequest *)request
{
	NSString *responseString = [request responseString];
	[[[UIAlertView alloc] initWithTitle:@"登录结果"
		message:responseString
		delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil]
	 show];
}
 // 发送请求失败时激发该方法
 - (void)requestWentWrong:(ASIHTTPRequest *)request
{
	NSError *error = request.error;
	NSLog(@"获取服务器响应出现错误%@" , error);
}
- (IBAction)finishEdit:(id)sender {
	[sender resignFirstResponder];
}
@end
