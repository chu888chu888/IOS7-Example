//
//  FKAccount.h
//  DrawTest
//
//  Created by yeeku on 13-9-7.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKAccount : NSObject
// 封装账户编号、账户余额两个属性
@property (nonatomic, copy) NSString* accountNo;
@property (nonatomic, readonly) CGFloat balance;
- (id)initWithAccountNo:(NSString*)accountNo
				balance:(CGFloat)balance;
- (void) draw:(CGFloat)drawAmount;
@end
