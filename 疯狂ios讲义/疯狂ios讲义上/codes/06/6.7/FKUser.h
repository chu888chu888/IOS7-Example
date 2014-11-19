//  Created by yeeku on 2013-4-19.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKItem.h"

// 定义类的接口部分
@interface FKUser : NSObject
{
	// 定义FKUser对象持有FKItem对象
	FKItem* _item;
}
- (void) setItem:(FKItem*) item;
- (FKItem*) item;
@end
