//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKItem.h"

// 为FKItem定义一个类别
@interface FKItem (fk)
// 在类别中前向声明calDiscount:方法
- (double) calDiscount:(double)discount;
@end
int main(int argc , char * argv[])
{
	@autoreleasepool{
		FKItem* item = [[FKItem alloc] init];
		item.price = 109;
		[item info];
		NSLog(@"物品打折的价格为：%g" , [item calDiscount:.75]);
	}
}
