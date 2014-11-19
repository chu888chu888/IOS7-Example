//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 定义PI代替3.1415926
#define PI 3.1415926

int main(int argc , char * argv[])
{
	@autoreleasepool{
		NSLog(@"请输入圆的半径：");
		double radius;
		scanf("%lg" , &radius);
		// 使用PI
		NSLog(@"圆周长：%g" , PI * 2 * radius);
		NSLog(@"圆面积：%g" , PI * radius * radius);
	}
}
