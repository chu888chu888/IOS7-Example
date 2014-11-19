//  Created by yeeku on 2013-3-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		float af = 25.2345556;
		// 下面将看到af的值已经发生了改变,float只能接受6位有效数值
		NSLog(@"%9g" , af);
		double dd = 25234.5556;
		// 下面将看到dd的值已经发生了改变,它只能接受6位有效数值
		NSLog(@"%9e" , dd);
		double a = 0.0;
		// 5.0除以0.0将出现正无穷大
		NSLog(@"5.0/a的值为：%g" , 5.0 / a);
		// 所有正无穷大都相等，所以下面将会输出1，代表真。
		NSLog(@"%d" , 5.0 / a == 50000 / 0.0);
		// -5.0除以0.0将出现负无穷大		
		NSLog(@"-5.0/a的值为：%g" , -5.0 / a);
		// 所有负无穷大都相等，所以下面将会输出1，代表真。
		NSLog(@"%d" , -5.0 / a == -50000 / 0.0);
		// 0.0除以0.0将出现非数
		double nan = a / a;
		NSLog(@"a/a的值为：%g" , nan);
		// 非数与自己都相等，所以下面将会输出0，代表假。
		NSLog(@"%d" , nan == nan);
		int ia = -5 / 0.0;
		// 得到int取值范围的边界值
		NSLog(@"%d" , ia);		
	}
}
