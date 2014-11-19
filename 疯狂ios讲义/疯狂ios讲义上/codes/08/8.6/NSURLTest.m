//  Created by yeeku on 2013-5-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建NSURL
		NSURL* url = [NSURL
			URLWithString:@"http://www.crazyit.org/index.php"];
		NSLog(@"url的scheme为：%@", [url scheme]);
		NSLog(@"url的host为：%@", [url host]);
		NSLog(@"url的port为：%@", [url port]);
		NSLog(@"url的path为：%@", [url path]);
		// 使用URL对应的资源来初始化NSString对象
		NSString* homePage = [NSString stringWithContentsOfURL:
			url encoding: NSUTF8StringEncoding error:nil];
		// 输出NSString内容，即可看到页面源代码
		NSLog(@"%@" , homePage);
	}
}
