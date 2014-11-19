//  Created by yeeku on 2013-5-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 获取当前进程对应的ProcessInfo对象
		NSProcessInfo* proInfo = [NSProcessInfo processInfo];
		// 获取运行该程序所指定的参数
		NSArray* arr = [proInfo arguments];	
		NSLog(@"运行程序的参数为：%@" , arr);
		NSLog(@"进程标识符为：%d" ,
			[proInfo processIdentifier]);
		NSLog(@"进程的进程名为：%@" ,
			[proInfo processName]);
		NSLog(@"进程所在系统的主机名为：%@" 
			, [proInfo hostName]);
		NSLog(@"进程所在系统的操作系统为：%ld" 
			, [proInfo operatingSystem]);
		NSLog(@"进程所在系统的操作系统名为：%@" 
			, [proInfo operatingSystemName]);
		NSLog(@"进程所在系统的操作系统版本字符串为：%@"
			, [proInfo operatingSystemVersionString]);
		NSLog(@"进程所在系统的物理内存为：%lld"
			, [proInfo physicalMemory]);
		NSLog(@"进程所在系统的处理器数量为：%ld" 
			, [proInfo processorCount]);
		NSLog(@"进程所在系统的激活的处理器数量为：%ld" 
			, [proInfo activeProcessorCount]);
		NSLog(@"进程所在系统的运行时间为：%f"
			, [proInfo systemUptime]);
	}
}
