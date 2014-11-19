//  Created by yeeku on 2013-4-16.
//  Copyright (c) 2013年 crazyit.org. All rights 

#import <Cocoa/Cocoa.h>
#import	"FKAppDelegate.h"

int main(int argc, char *argv[])
{
	@autoreleasepool {
		// 创建一个FKAppDelegate对象，该对象实现了NSApplicationDelegate协议
		FKAppDelegate* delegate = [[FKAppDelegate alloc] init];
		// 获取NSApplication的单例对象
		[NSApplication sharedApplication];
		// 调用静态方法为Cocoa应用设置代理，将应用发生事件委托给delegate处理
		[NSApp setDelegate: delegate];
		// 开始程序
		return NSApplicationMain(argc, (const char **)argv);
	}
}
