//  Created by yeeku on 2013-4-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKAppDelegate.h"

@implementation FKAppDelegate
@synthesize window;
// 当应用程序将要加载完成时激发该方法
- (void) applicationWillFinishLaunching: (NSNotification *) aNotification
{
	// 创建NSWindow对象，并赋值给window
	self.window = [[NSWindow alloc] initWithContentRect:
		NSMakeRect(300, 300, 320, 200)
		styleMask: (NSTitledWindowMask |NSMiniaturizableWindowMask
		| NSClosableWindowMask)
		backing: NSBackingStoreBuffered defer: NO];
	// 设置窗口标题
	self.window.title = @"Delegate测试";
	// 创建NSTextField对象，并赋值给label变量
	NSTextField * label = [[NSTextField alloc] initWithFrame: NSMakeRect(60, 120, 200, 60)];
	// 为label设置属性
	[label setSelectable: YES];
	[label setBezeled: YES];
	[label setDrawsBackground: YES];
	// 使用NSBundle获取该应用自包含的指定资源文件的路径
	NSString* filePath = [[NSBundle mainBundle] pathForResource:@"bookinf"
		ofType:@"txt"];
	// 使用指定文件的内容来初始化NSString
	NSString* content = [NSString stringWithContentsOfFile:filePath
												  encoding:NSUTF8StringEncoding error:nil];
	// 让label显示content字符串的内容
	[label setStringValue: content];
	// 创建NSButton对象，并赋值给button变量
	NSButton * button = [[NSButton alloc] initWithFrame:
		NSMakeRect(120, 40, 80, 30)];
	// 为button设置属性	
	button.title = @"确定";
	[button setBezelStyle:NSRoundedBezelStyle];
	[button setBounds:NSMakeRect(120, 40, 80, 30)];
	// 将label、button添加到窗口中
	[self.window.contentView addSubview: label];
	[self.window.contentView addSubview: button];
}
// 当应用程序加载完成时激发该方法
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// 把该窗口显示到该应用程序的前台
	[self.window makeKeyAndOrderFront: self];
}
@end
