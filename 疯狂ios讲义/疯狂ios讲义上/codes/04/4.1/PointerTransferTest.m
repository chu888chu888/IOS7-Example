//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

// 定义一个DataWrap类
@interface DataWrap : NSObject
// 为DataWrap定义a、b两个属性
@property int a;
@property int b;
@end
@implementation DataWrap
// 合成a、b两个属性
@synthesize a, b;
@end

void swap(DataWrap* dw)
{
	// 下面三行代码实现dw的a、b两个属性值交换。
	// 定义一个临时变量来保存dw对象的a属性的值
	int tmp = dw.a;
	// 把dw对象的b属性值赋给a属性
	dw.a = dw.b;
	// 把临时变量tmp的值赋给dw对象的b属性
	dw.b = tmp;
	NSLog(@"swap函数里，属性a的值是：%d；属性b的值是：%d"
			, dw.a , dw.b); 
	// 把dw直接赋为null，让它不再指向任何有效地址。
	dw = nil;			
}


int main(int argc , char * argv[])
{
	@autoreleasepool{
		DataWrap* dw = [[DataWrap alloc] init];
		dw.a = 6;
		dw.b = 9;
		swap(dw);
		NSLog(@"交换结束后，属性a的值是：%d；属性b的值是：%d"
				, dw.a , dw.b);
	}
}
