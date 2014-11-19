//
//  FKGradientView.h
//  GradientTest
//
//  Created by yeeku on 13-7-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
// 定义一个枚举类型，代表各渐变类型
typedef enum
{
	kLinearGradient = 0,
	kRadialGradient
} GradientType;
@interface FKGradientView : UIView
@property (nonatomic, assign) GradientType type;
@property (nonatomic, assign) BOOL beforeStart;
@property (nonatomic, assign) BOOL afterEnd;
@end
