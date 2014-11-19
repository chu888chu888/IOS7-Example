//  Created by yeeku on 2013-4-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

@interface FKUser : NSObject
// 使用@property定义3个property
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* pass;
@property (nonatomic, copy) NSDate* birth;
@end
