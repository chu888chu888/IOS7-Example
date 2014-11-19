//  Created by yeeku on 2013-3-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		NSString * str = 5 > 3 ? @"5大于3" : @"5不大于3";
		// 输出"5大于3"
		NSLog(@"%@" , str);
		// 输出"5大于3"
		5 > 3 ? NSLog(@"5大于3") : NSLog(@"5小于3");
		int a = 5;
		int b = 5;
		// 下面将输出a等于b
		a > b ? NSLog(@"a大于b") : (a < b ? NSLog(@"a小于b") : NSLog(@"a等于b"));
 	}
}