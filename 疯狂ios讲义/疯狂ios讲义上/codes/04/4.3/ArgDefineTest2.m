//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 定义PI代替3.1415926
#define PI 3.1415926
// 直接使用前面已有的PI来定义新的宏
#define GIRTH(r) (PI * 2 * (r))
// 直接使用前面已有的PI来定义新的宏
#define AREA(r) (PI * (r) * (r))

int main(int argc , char * argv[])
{
	@autoreleasepool{
		NSLog(@"请输入圆的半径：");
		double radius;
		scanf("%lg" , &radius);
		// 使用宏执行计算
		NSLog(@"圆周长：%g" , GIRTH(radius));
		NSLog(@"圆面积：%g" , AREA(radius));
	}
}
