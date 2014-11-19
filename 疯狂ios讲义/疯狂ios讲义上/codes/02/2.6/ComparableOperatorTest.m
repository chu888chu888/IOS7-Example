//  Created by yeeku on 2013-3-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool {
		// 输出1
		NSLog(@"5是否大于 4.0：%d" , (5 > 4.0));
		// 输出1
		NSLog(@"5和5.0是否相等：%d" , (5 == 5.0));
		// 输出1
		NSLog(@"97和'a'是否相等：%d" , (97 == 'a'));
		// 输出0
		NSLog(@"YES和NO是否相等：%d" , (YES == NO));
		// 创建2个ComparableOperatorTest对象，分别赋给t1和t2两个引用
		NSDate * t1 = [[NSDate alloc] init];
		NSDate * t2 = [[NSDate alloc] init];
		// t1和t2是同一个类的两个实例的引用，所以可以比较，
		// 但t1和t2引用不同的对象，所以返回0
		NSLog(@"t1是否等于t2：%d" , (t1 == t2));
	}
}