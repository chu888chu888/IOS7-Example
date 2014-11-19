//  Created by yeeku on 2013-4-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Cocoa/Cocoa.h>

// 实现NSApplicationDelegate协议
@interface FKAppDelegate : NSObject <NSApplicationDelegate>
// 定义一个属性来代表程序窗口
@property (strong) NSWindow *window;
@property (nonatomic, assign) int count;
@end
