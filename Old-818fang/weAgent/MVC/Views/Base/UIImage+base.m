//
//  UIImage+base.m
//  weChat
//
//  Created by apple on 14-9-25.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "UIImage+base.h"

@implementation UIImage (base)
- (UIImage*)beResize{
    CGFloat top = 7; // 顶端盖高度
    CGFloat bottom = 7 ; // 底端盖高度
    CGFloat left = 7; // 左端盖宽度
    CGFloat right = 7; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    return [self resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
}
@end
