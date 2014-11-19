//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKCard.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		FKCard* card = [[FKCard alloc] init];
		// 通过点语法对属性赋值
		card.flower = @"♠";
		card.value = @"A";
		// 通过点语法来访问属性值
		NSLog(@"我的扑克牌为：%@%@", card.flower, card.value);
	}
}
