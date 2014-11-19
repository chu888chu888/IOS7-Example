//  Created by yeeku on 2013-4-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKApple.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		FKApple* app = [[FKApple alloc] init];
		// 通过对象来判断该对象的Class
		NSLog(@"%@" , [app class]);
		// 判断对象是否为某个类的实例
		NSLog(@"app是否为FKApple的实例：%d", 
			[app isMemberOfClass: FKApple.class]);
		NSLog(@"app是否为NSObject的实例：%d",
			[app isMemberOfClass: NSObject.class]);
		// 判断对象是否为某个类及其子类的实例			
		NSLog(@"app是否为FKApple及其子类的实例：%d",
			[app isKindOfClass: FKApple.class]);
		NSLog(@"app是否为NSObject及其子类的实例：%d",
			[app isKindOfClass: NSObject.class]);
		// 判断对象是否实现了指定协议
		NSLog(@"app是否实现FKEatable协议：%d",
			[app conformsToProtocol: @protocol(FKEatable)]);
	}
}