//
//  UITextField+base.m
//  weChat
//
//  Created by apple on 14-9-22.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "UITextField+base.h"


@implementation UITextField (base)
- (void)beGreen{
//    CGFloat top = 10; // 顶端盖高度
//    CGFloat bottom = 10 ; // 底端盖高度
//    CGFloat left = 10; // 左端盖宽度
//    CGFloat right = 10; // 右端盖宽度
//    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
////    [self setBackgroundColor:[UIColor redColor]];
////
//    [self setBackground:[[UIImage imageNamed:@"bg_button_review"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch]];
    //边框颜色
    self.layer.cornerRadius = 2.0f;
    self.layer.borderWidth= 1.0f;
    self.layer.borderColor=[[UIColor colorWithRed:110/255.0 green:181/255.0 blue:163/255.0 alpha:1] CGColor];
    //左边空格
    UILabel * leftView = [[UILabel alloc] initWithFrame:CGRectMake(10,0,7,26)];
    leftView.backgroundColor = [UIColor clearColor];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //字体大小
    self.font = [UIFont fontWithName:@"Helvetica" size:12];
}

- (void)addLeftImgNamed:(NSString *)img {
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0,0,28,26)];
    UIImageView *userImg = [[UIImageView alloc] initWithFrame:CGRectMake(7,6,14,14)];
    [leftView addSubview:userImg];
    [userImg setImage:[UIImage imageNamed:img]];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
}

- (void)addUserLeftImg{
      [self addLeftImgNamed:@"user"];
}

- (void)addLockLeftImg{
    [self addLeftImgNamed:@"lock"];
}
@end
