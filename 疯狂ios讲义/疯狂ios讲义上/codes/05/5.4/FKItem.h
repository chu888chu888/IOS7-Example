//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

@interface FKItem : NSObject
// 使用@property定义1个property，并指定自定义的getter、setter方法名
@property (assign , nonatomic , getter=wawa , setter=nana:) int price;
@end
