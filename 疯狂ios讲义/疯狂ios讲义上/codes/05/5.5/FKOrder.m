//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKOrder.h"

@implementation FKOrder
@synthesize item;
@synthesize amount;
-(int) totalPrice
{
	return item.price * amount;
}
@end