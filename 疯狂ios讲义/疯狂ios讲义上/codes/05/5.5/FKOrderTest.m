//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKOrder.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建FKItem对象
		FKOrder* order = [[FKOrder alloc] init];
		// 使用KVC方式为amount设置属性值
		[order setValue:@"12" forKey:@"amount"];
		[order setValue:[[FKItem alloc] init] forKey:@"item"];
		// 使用setValue:forKeyPath设置item属性的name属性
		[order setValue:@"鼠标" forKeyPath:@"item.name"];
		// 使用valueForKeyPath来获取复合属性值
		[order setValue:[NSNumber numberWithInt:20] forKeyPath:@"item.price"];
		NSLog(@"订单包含%@个%@，总价为：%@", [order valueForKey:@"amount"] , 
			[order valueForKeyPath:@"item.name"],
			[order valueForKey:@"totalPrice"]);
	}
}
