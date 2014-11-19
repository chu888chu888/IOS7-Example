//  Created by yeeku on 2013-3-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc ,char * argv[]) 
{
	@autoreleasepool {
		// 定义变量a为3.2
		double a = 3.2;
		// 求a的5次方，并将计算结果赋为b。
		double b = pow(a , 5);
		// 输出b的值
		NSLog(@"%g" , b);
		// 求a的平方根，并将结果赋给c
		double c = sqrt(a);
		// 输出c的值
		NSLog(@"%g" ,c);
		// 计算随机数,返回一个0～10之间的伪随机数。
		double d = arc4random() % 10;
		// 输出随机数d的值
		NSLog(@"随机数：%g" ,d);
		// 求1.57的sin函数值：1.57被当成弧度数
		double e = sin(1.57);
		// 输出接近1
		NSLog(@"%g" ,e);
		// 定义double变量x，其值为-5.0
		double x = -5.0;
		// 将x求负，其值变成5.0。
		x = -x;
		// 输出接近1
		NSLog(@"%g" ,x);
		
	}
}
