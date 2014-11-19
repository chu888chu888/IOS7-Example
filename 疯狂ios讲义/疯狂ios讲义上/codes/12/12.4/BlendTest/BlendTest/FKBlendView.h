//
//  FKBlendView.h
//  BlendTest
//
//  Created by yeeku on 13-7-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKBlendView : UIView
@property(nonatomic, strong) UIColor *sourceColor;
@property(nonatomic, strong) UIColor *destinationColor;
@property(nonatomic, assign) CGBlendMode blendMode;
@end
