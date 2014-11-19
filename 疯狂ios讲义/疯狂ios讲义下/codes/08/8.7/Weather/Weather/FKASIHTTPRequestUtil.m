//
//  FKASIHTTPRequestUtil.m
//  Weather
//
//  Created by yeeku on 13-10-6.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKASIHTTPRequestUtil.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

@implementation FKASIHTTPRequestUtil
- (NSString*) synchronousRequest:(NSString*) webServiceURL
{
	// 创建NSURL对象
	NSURL *url = [NSURL URLWithString:webServiceURL];
	// ASIHTTPRequest对象用来发送简单的Get请求
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
	// 发送同步请求
	[request startSynchronous];
	// 通过检查error属性可以判断请求是否成功或发生错误。
	NSError *error = [request error];
	if (!error)
	{
		return [request responseString];
	}
	NSLog(@"发送无参数的GET请求时发生错误：%@", error);
	return nil;
}
- (NSString*) synchronousRequest:(NSString*) webServiceURL
	paramName:(NSString *) cityName paramValue:(NSString *) cityValue
{
	NSURL *url = [NSURL URLWithString:webServiceURL];
	// 使用ASIFormDataRequest发送带参数的POST请求
	ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
	// 添加请求参数
	[request setPostValue:cityValue forKey:cityName];
	// 发送同步请求
	[request startSynchronous];
	// 通过检查error属性可以判断请求是否成功或发生错误。
	NSError *error = [request error];
	if (!error)
	{
		return [request responseString];
	}
	NSLog(@"发送带参数的POST请求时发生错误：%@", error);
	return nil;
}
@end
