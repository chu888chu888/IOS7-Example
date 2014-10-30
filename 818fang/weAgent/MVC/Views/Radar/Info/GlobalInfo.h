//
//  GlobalInfo.h
//  weChat
//
//  Created by apple on 14-9-29.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//
#import "GlobalUIView.h"
#import "KIImagePager.h"

@interface GlobalInfo : GlobalUIView
@property (nonatomic) KIImagePager *imagePager;
@property (nonatomic) UIView *phoneView;
@property (nonatomic) UIButton *givePhone;
@property (nonatomic) UIButton *givePhoneCopy;
@property (nonatomic) UILabel *name;
@property (nonatomic) UILabel *phone;
@property (nonatomic) UILabel *nameCopy;
@property (nonatomic) UILabel *phoneCopy;
@property (nonatomic) UILabel *time;
@property (nonatomic) UILabel *timeCopy;
@property (nonatomic) UILabel *title;
@property (nonatomic) UILabel *locationLabel;
@property (nonatomic) UITextView *describe;
@property (nonatomic) UILabel *visitNum;
@property (nonatomic) UILabel *collectNum;
@property (nonatomic) UILabel *blackNum;
@property (nonatomic) UILabel *callNum;
@property (nonatomic) UIView *validTitleView;
@property (nonatomic) UIButton *blockBtn;
- (UIView*)makeStarsView:(float)rate;
- (void)addAdView;
- (void)addContactView;
- (void)addRealDetailView;
- (void)addValidView;
- (void)addAddressView;
- (void)addDescribeView;
- (void)addPhoneView;
- (void)addFooterView;
- (CSLinearLayoutItem*)makeDashedLineViewItem;
- (CSLinearLayoutItem*)makeLineViewItem;
- (UIView*)makePhoneView;
- (UIView*)makeTitleView:(NSString*)title withIconName:(NSString*)iconName;
- (void)addBlockView;



@end