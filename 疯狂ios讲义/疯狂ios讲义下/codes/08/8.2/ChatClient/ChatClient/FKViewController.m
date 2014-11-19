//
//  FKViewController.m
//  ChatClient
//
//  Created by yeeku on 13-9-18.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>
#import "FKViewController.h"

@implementation FKViewController
NSString* myName;
CFSocketRef _socket;
BOOL isOnline;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建一个UIAlertView提醒用户输入名字
	UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"名字"
		message:@"请输入您的名字" delegate:self cancelButtonTitle:@"确定"
		otherButtonTitles: nil];
	// 设置该UIAlertView为UIAlertViewStylePlainTextInput风格
	alert.alertViewStyle = UIAlertViewStylePlainTextInput;
	[alert show];
}
// 读取接收的数据
- (void)readStream
{
	char buffer[2048];
	int hasRead;
	//与本机关联的Socket 如果已经失效返回－1:INVALID_SOCKET
	while ((hasRead = recv(CFSocketGetNative(_socket)
		, buffer, sizeof(buffer), 0)))
	{
		NSString* content = [[NSString alloc] initWithBytes:buffer
			length:hasRead encoding:NSUTF8StringEncoding];
		// 使用主线程来更新UI控件的状态
		dispatch_async(dispatch_get_main_queue(), ^{
			self.showView.text = [NSString stringWithFormat:@"%@\n%@",
				content ,self.showView.text];
		});
	}
}
- (IBAction)finishEdit:(id)sender
{
	[sender resignFirstResponder];
}
- (IBAction)send:(id)sender
{
	if(isOnline)
	{
		NSString* stringTosend = [NSString stringWithFormat:@"%@说：%@"
			, myName, self.inputField.text];
		self.inputField.text = nil;
		const char* data = [stringTosend UTF8String];
		send(CFSocketGetNative(_socket), data, strlen(data) + 1 , 1);
	}
	else
	{
		NSLog(@"暂未连接服务器");
	}
}
- (void)alertView:(UIAlertView *)alertView
	clickedButtonAtIndex:(NSInteger)buttonIndex
{
	// 获取UIAlertView控件上文本框内的字符串，并将字符串赋值给myName变量
	myName = [alertView textFieldAtIndex:0].text;
	// 创建Socket，无需回调函数函数
	_socket = CFSocketCreate(kCFAllocatorDefault
		, PF_INET // 指定协议族，如果该参数为0或者负数，则默认为PF_INET
		// 指定Socket类型，如果协议族为PF_INET，且该参数为0或负数，
		// 则它会默认为SOCK_STREAM，如果要使用UDP协议，则该参数指定为SOCK_DGRAM
		, SOCK_STREAM
		// 指定通信协议。如果前一个参数为SOCK_STREAM，默认使用TCP协议
		// 如果前一个参数为SOCK_DGRAM，默认使用UDP协议。
		, IPPROTO_TCP
		// 该参数指定下一个回调函数所监听的事件类型
		, kCFSocketNoCallBack
		, nil
		, NULL);
	if (_socket != nil)
	{
		// 定义sockaddr_in类型的变量，该变量将作为CFSocket的地址
		struct sockaddr_in addr4;
		memset(&addr4, 0, sizeof(addr4));
		addr4.sin_len = sizeof(addr4);
		addr4.sin_family = AF_INET;
		// 设置连接远程服务器的地址
		addr4.sin_addr.s_addr = inet_addr("192.168.1.88");
		// 设置连接远程服务器的监听端口
		addr4.sin_port = htons(30000);
		// 将IPv4的地址转换为CFDataRef
		CFDataRef address = CFDataCreate(kCFAllocatorDefault
			, (UInt8 *)&addr4, sizeof(addr4));
		// 连接远程服务器器的Socket，并返回连接的结果
		CFSocketError result = CFSocketConnectToAddress(_socket
			, address // 指定远程服务器的IP和端口
			, 5  // 指定连接超时时长，如果该参数为负数，则把连接操作放在后台进行，
			// 当_socket消息类型为kCFSocketConnectCallBack，
			// 将会在连接成功或失败的时候在后台触发回调函数
			);
		// 如果连接远程服务器成功
		if(result == kCFSocketSuccess)
		{
			isOnline = YES;
			// 启动新线程来读取服务器响应的数据
			[NSThread detachNewThreadSelector:@selector(readStream)
									 toTarget:self withObject:nil];
		}
	}
}
@end
