//
//  FKViewController.m
//  NSURLConnectionTest
//
//  Created by yeeku on 13-9-19.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@implementation FKViewController
NSMutableData* totalData;
- (void)viewDidLoad
{
	[super viewDidLoad];
	NSString* str = @"http://www.crazyit.org/ethos.php";
	totalData = [[NSMutableData alloc] init];
	// 以指定NSString创建NSURL对象
	NSURL* url = [NSURL URLWithString:str];
	// 创建NSURLRequest对象
//	NSURLRequest* request = [NSURLRequest requestWithURL:url];
	// 通过这种方式创建的NSURLRequest可以指定缓存策略、超时时长
	NSURLRequest* request = [NSURLRequest requestWithURL:url
		cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:5];
	// 以指定URL、delegate创建连接、发送请求
	NSURLConnection* conn = [NSURLConnection connectionWithRequest:request
		delegate:self];
	// 如果conn为nil，直接返回
	if(conn != nil)
	{
		return;
	}
}
// 当服务器系响应生成时激发该方法。
-(void)connection:(NSURLConnection *)connection
	didReceiveResponse:(NSURLResponse *)response
{
	NSLog(@"--didReceiveResponse--");
	NSLog(@"响应的数据类型：%@" , response.MIMEType);
	// 获取响应数据的长度，如果不能检测到长度，返回NSURLResponseUnknownLength（-1）
	NSLog(@"响应的数据长度为：%lld"
		, response.expectedContentLength);
	NSLog(@"响应的数据所使用的字符集：%@" , response.textEncodingName);
	NSLog(@"响应的文件名：%@" , response.suggestedFilename);
}
// 每次读取服务器响应的数据时，都会激发该方法。
// 对于一个请求而言，服务器数据可能要分几次才能读取，因此该方法将会被触发多次。
// 如果程序需要将这些数据转换成字符串，建议使用NSMutableData来收集这些数据、然后整体转换
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData* )data
{
	[totalData appendData:data];
}
// 当连接服务器出现错误时激发该方法。可通过error获取错误信息
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
		NSLog(@"-error--");
}
// 当数据load完成时激发该方法，对于每次请求，该方法只会被激发一次。
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSLog(@"--finishLoading--");
	NSString* content = [[NSString alloc] initWithData:totalData
		encoding:NSUTF8StringEncoding];
	// 清空所有数据。
	[totalData setLength:0];
	self.showView.text = content;
}
@end
