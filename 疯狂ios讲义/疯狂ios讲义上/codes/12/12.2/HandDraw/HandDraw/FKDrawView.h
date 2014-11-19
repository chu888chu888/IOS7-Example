//
//  FKDrawView.h
//  HandDraw
//
//  Created by yeeku on 13-7-11.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"

@interface FKDrawView : UIView
@property (nonatomic, strong) UIColor* currentColor;
@property (nonatomic, assign) ShapeType shape;
@end
