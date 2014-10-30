//
//  Rader.h
//  weChat
//
//  Created by apple on 14-9-23.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "GlobalUIView.h"
#import "KIImagePager.h"
#import "M13BadgeView.h"

@interface Radar : GlobalUIView

@property (nonatomic) KIImagePager *imagePager;
@property (nonatomic, retain) M13BadgeView *forRentBadgeView;
@property (nonatomic, retain) M13BadgeView *rentBadgeView;
@property (nonatomic, retain) M13BadgeView *secondBadgeView;
@property (strong, nonatomic) UIImageView *radarPointer;
@property (strong, nonatomic) UIButton *searchBtn;
@property (strong, nonatomic) UIButton *forRentBoard;
@property (strong, nonatomic) UIButton *rentBoard;
@property (strong, nonatomic) UIButton *secondBoard;
//@property (strong, nonatomic) UIBarButtonItem *rightButton;

@end
