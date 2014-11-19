//
//  FKViewController.m
//  AsyncChatClient
//
//  Created by yeeku on 13-9-19.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@implementation FKViewController
NSString* myName;
AsyncSocket* socket;
BOOL isOnline;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建一个UIAlertView提醒用户输入名字
	UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"名字"
		message:@"请输入您的名字" delegate:self
		cancelButtonTitle:@"确定" otherButtonTitles: nil];
	// 设置该UIAlertView为UIAlertViewStylePlainTextInput风格
	alert.alertViewStyle = UIAlertViewStylePlainTextInput;
	[alert show];
}

- (IBAction)finishEdit:(id)sender
{
	[sender resignFirstResponder];
}
- (IBAction)send:(id)sender
{
	if(isOnline)
	{
		// 定义要发送的字符串内容
		NSString* stringTosend = [NSString stringWithFormat:@"%@说：%@"
			, myName, self.inputField.text];
		self.inputField.text = nil;
		NSData *data = [stringTosend dataUsingEncoding:NSUTF8StringEncoding];
		// 调用writeData:withTimeout:tag:方法发送数据
		[socket writeData:data withTimeout:-1 tag:0];
	}
	else
	{
		NSLog(@"暂未连接服务器");
	}
}
// AsyncSocketDelegate中定义的方法，当成功连接到服务器时激发该方法
- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host
	port:(UInt16)port
{
	isOnline = YES;
	// 调用readDataWithTimeout:tag:方法读取数据
	[sock readDataWithTimeout:-1 tag:0];
}
// AsyncSocketDelegate中定义的方法，当读取数据完成时激发该方法
- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data
	withTag:(long)tag
{
	// 获取读到的内容
	NSData* strData = [data subdataWithRange:NSMakeRange(0, [data length])];
	NSString* content = [[NSString alloc] initWithData:strData
		encoding:NSUTF8StringEncoding];
	if(content)
	{
		// 使用showView控件显示从网络读取的内容
		self.showView.text = [NSString stringWithFormat:@"%@\n%@",
			content ,self.showView.text];
	}
	// 再次调用readDataWithTimeout:tag:方法读取数据
	[sock readDataWithTimeout:-1 tag:0];
}
- (void)alertView:(UIAlertView *)alertView
	clickedButtonAtIndex:(NSInteger)buttonIndex
{
	// 获取UIAlertView控件上文本框内的字符串，并将字符串赋值给myName变量
	myName = [alertView textFieldAtIndex:0].text;
	socket = [[AsyncSocket alloc] initWithDelegate:self];
	NSError* error = nil;
	int port = 30000;
	NSString* host = @"192.168.1.88";
	// 调用connectToHost:onPort:error:方法连接指定IP、端口的服务器
	[socket connectToHost:host onPort:port withTimeout:2 error:&error];
	if (error)
	{
		NSLog(@"连接出现错误：%@",error);
	}
}
@end
