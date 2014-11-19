//
//  FKLoginController.m
//  AFNetworkingAccess
//
//  Created by yeeku on 13-10-4.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKLoginController.h"
#import "FKAppDelegate.h"

@interface FKLoginController ()
{
	FKAppDelegate* appDelegate;
}
@end
@implementation FKLoginController
- (void)viewDidLoad
{
	[super viewDidLoad];
	appDelegate = [UIApplication sharedApplication].delegate;
}
- (IBAction)loginBnClicked:(id)sender
{
	// 获取用户输入的用户名和密码
	NSString* name = self.nameField.text;
	NSString* pass = self.passField.text;
	if(name != nil && name.length > 0
	   && pass != nil && pass.length > 0)
	{
		// 使用NSDictionary封装请求参数
		NSDictionary* params = @{@"name": name , @"pass" : pass};
		// 使用AFHTTPRequestOperationManager发送POST请求
		[appDelegate.manager
			POST:@"http://192.168.1.88:8888/AFNetworkingServer/login.jsp"
			parameters:params  // 指定请求参数
			// 获取服务器响应成功时激发的代码块
			success:^(AFHTTPRequestOperation *operation, id responseObject)
		 	{
				// 当使用HTTP响应解析器时，服务器响应数据被封装在NSData中
				// 此处将NSData转换成NSString、并使用UIAlertView显示登录结果
				[[[UIAlertView alloc] initWithTitle:@"登录结果" message:
					[[NSString alloc] initWithData:responseObject encoding:
					NSUTF8StringEncoding]
					delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil]
					show];

			}
			// 获取服务器响应失败时激发的代码块
		 	failure:^(AFHTTPRequestOperation *operation, NSError *error)
			{
				NSLog(@"获取服务器响应出错！");
			}];
	}
}
- (IBAction)finishEdit:(id)sender {
	[sender resignFirstResponder];
}
@end
