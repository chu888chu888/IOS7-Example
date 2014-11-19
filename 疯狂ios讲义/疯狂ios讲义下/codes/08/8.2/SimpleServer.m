#import <sys/socket.h>
#import <arpa/inet.h>

#import <Foundation/Foundation.h>
// 读取数据的回调函数
void readStream(CFReadStreamRef iStream
	, CFStreamEventType eventType, void *clientCallBackInfo)
{
	UInt8 buff[2048];
	CFIndex hasRead = CFReadStreamRead(iStream, buff, 2048);
	if(hasRead > 0)
	{
		// 强制只处理hasRead前面的数据
		buff[hasRead] = '\0';	 
		printf("接收到数据: %s\n", buff);
	}
}
// 有客户端连接进来的回调函数 
void TCPServerAcceptCallBack(CFSocketRef socket, CFSocketCallBackType type
	, CFDataRef address, const void *data, void *info)
{
	// 如果有客户端Socket连接进来
	if (kCFSocketAcceptCallBack == type) {
		// 获取本地Socket的Handle
		CFSocketNativeHandle nativeSocketHandle = *(CFSocketNativeHandle*)data;
		uint8_t name[SOCK_MAXADDRLEN];
		socklen_t nameLen = sizeof(name);
		// 获取对方Socket信息，还有getsocketname()函数则用于获取本程序所在Socket信息
		if (getpeername(nativeSocketHandle
			, (struct sockaddr *)name, &nameLen) != 0)
		{
			NSLog(@"error");
			exit(1);
		}
		// 获取连接信息
		struct sockaddr_in * addr_in = (struct sockaddr_in*) name;
		NSLog(@"%s:%d连接进来了", inet_ntoa(addr_in->sin_addr)
			, addr_in->sin_port);
		CFReadStreamRef iStream;
		CFWriteStreamRef oStream;
		// 创建一组可读写的CFStream
		CFStreamCreatePairWithSocket(kCFAllocatorDefault
			, nativeSocketHandle, &iStream, &oStream);
		if (iStream && oStream)
		{
			// 打开输入流和输出流
			CFReadStreamOpen(iStream);
			CFWriteStreamOpen(oStream);
			CFStreamClientContext streamContext = {0, NULL, NULL, NULL};			
			if (!CFReadStreamSetClient(iStream, kCFStreamEventHasBytesAvailable,
				readStream/*回调函数，当有可读的数据时调用*/, &streamContext))
			{
				exit(1);
			}
			CFReadStreamScheduleWithRunLoop(iStream
				, CFRunLoopGetCurrent(), kCFRunLoopCommonModes);
			const char* str = "您好，您收到了Mac服务器的新年祝福！\n";
			// 向客户端输出数据
			CFWriteStreamWrite(oStream, (UInt8*)str, strlen(str) + 1);
		}
	}
}
int main(int argc, char * argv[])
{
	@autoreleasepool {
		// 创建Socket，指定TCPServerAcceptCallBack
		// 作为kCFSocketAcceptCallBack事件的监听函数
		CFSocketRef _socket = CFSocketCreate(kCFAllocatorDefault
			, PF_INET // 指定协议族，如果该参数为0或者负数，则默认为PF_INET
			// 指定Socket类型，如果协议族为PF_INET，且该参数为0或负数，
			// 则它会默认为SOCK_STREAM，如果要使用UDP协议，则该参数指定为SOCK_DGRAM
			, SOCK_STREAM
			// 指定通信协议。如果前一个参数为SOCK_STREAM，默认使用TCP协议
			// 如果前一个参数为SOCK_DGRAM，默认使用UDP协议。
			, IPPROTO_TCP
			// 该参数指定下一个回调函数所监听的事件类型
			, kCFSocketAcceptCallBack
			, TCPServerAcceptCallBack // 回调函数
			, NULL);
		if(_socket == NULL)
		{
			NSLog(@"创建Socket失败!");
			return 0;
		}
		int optval = 1;
		// 设置允许重用本地地址和端口
		setsockopt(CFSocketGetNative(_socket), SOL_SOCKET, SO_REUSEADDR,
			(void *)&optval, sizeof(optval));
		// 定义sockaddr_in类型的变量，该变量将作为CFSocket的地址
		struct sockaddr_in addr4;
		memset(&addr4, 0, sizeof(addr4));
		addr4.sin_len = sizeof(addr4);
		addr4.sin_family = AF_INET;
		// 设置该服务器监听本机任意可用的IP地址
		// addr4.sin_addr.s_addr = htonl(INADDR_ANY);
		// 设置服务器监听地址
		addr4.sin_addr.s_addr = inet_addr("192.168.1.100");
		// 设置服务器监听端口
		addr4.sin_port = htons(30000);
		// 将IPv4的地址转换为CFDataRef
		CFDataRef address = CFDataCreate(kCFAllocatorDefault
			 , (UInt8 *)&addr4, sizeof(addr4));
		// 将CFSocket绑定到指定IP地址
		if (CFSocketSetAddress(_socket, address) != kCFSocketSuccess)
		{
			NSLog(@"地址绑定失败！");
			// 如果_socket不为NULL，释放_socket
			if (_socket)
			{
				CFRelease(_socket);
				exit(1);
			}
			_socket = NULL;
		}
		NSLog(@"---启动循环监听客户端连接---");
		// 获取当前线程的CFRunLoop
		CFRunLoopRef cfRunLoop = CFRunLoopGetCurrent();
		// 将_socket包装成CFRunLoopSource
		CFRunLoopSourceRef source = CFSocketCreateRunLoopSource(
			kCFAllocatorDefault , _socket, 0);
		// 为CFRunLoop对象添加source
		CFRunLoopAddSource(cfRunLoop, source, kCFRunLoopCommonModes);
		CFRelease(source);
		// 运行当前线程的CFRunLoop
		CFRunLoopRun();
	}
	return 0;
}