//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKItemView.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 创建FKItem对象
		FKItem* item = [[FKItem alloc] init];
		// 设置item的属性
		item.name = @"疯狂iOS讲义";
		item.price = 109;
		// 创建FKItemView对象	
		FKItemView* itemView =  [[FKItemView alloc] init];
		// 将itemView的item属性设为item。
		itemView.item = item;
		[itemView showItemInfo];
		// 再次更给item对象的属性，将会激发监听器的方法
		item.name = @"疯狂XML讲义";
		item.price = 69;
	}
}
