//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKPerson.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// s1、s2直接指向常量池中的"疯狂iOS"
		NSString* s1 = @"疯狂iOS";
		NSString* s2 = @"疯狂iOS";
		// 看到s1、s2两个指针保存的地址值完全相等
		NSLog(@"s1地址：%p, s2地址：%p" , s1 , s2);
		// 所以下面程序输出1代表真
		NSLog(@"s1与s2是否相等：%d", (s1 == s2));
		// 让s3指向新生成的对象
		NSString* s3 = [NSString stringWithFormat:@"疯狂iOS"];
		// 输出说s3指针变量中保存的地址值与s1、s2并不相同
		NSLog(@"s3地址：%p" , s3);	
		// 所以下面程序输出0代表假
		NSLog(@"s1与s3是否相等：%d" , (s1 == s3));	
	}
}
