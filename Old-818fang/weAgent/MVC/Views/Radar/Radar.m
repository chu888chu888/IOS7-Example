//
//  Rader.m
//  weChat
//
//  Created by apple on 14-9-23.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "Radar.h"

@implementation Radar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize];

    }
    return self;
}

- (void) initialize
{
    [self addAdView];
    [self addRadarView];
    [self addNumBoardView];
 
}

- (void)addAdView
{
    _imagePager = [[KIImagePager alloc] init];
    _imagePager.frame = CGRectMake(0, 0, 320, 180);
    _imagePager.captionBackgroundColor = [UIColor clearColor];
    
    CSLinearLayoutItem *imagePagerItem = [CSLinearLayoutItem layoutItemForView:_imagePager];
    imagePagerItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    imagePagerItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:imagePagerItem];
  
}

- (void)addRadarView
{
    UIImageView *radarBoard = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 180, 180)];
    
    radarBoard.userInteractionEnabled = YES;
    [radarBoard setImage:[UIImage imageNamed:@"RadarBoard.png"]];
    
    _radarPointer = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 180, 180)];
    [_radarPointer setImage:[UIImage imageNamed:@"RadarPointer.png"]];
    [radarBoard addSubview:_radarPointer];
    
    _searchBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _searchBtn.frame = CGRectMake(0.0, 0.0, 180, 180);
    [_searchBtn setTitle:@"开始扫描" forState:UIControlStateNormal];
    [_searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _searchBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    [radarBoard addSubview:_searchBtn];
    
    CSLinearLayoutItem *radarBoardItem = [CSLinearLayoutItem layoutItemForView:radarBoard];
    radarBoardItem.padding = CSLinearLayoutMakePadding(10.0, 0.0, 0.0, 0.0);
    radarBoardItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:radarBoardItem];
    
}

- (void)addNumBoardView
{
    UIView *NumBoardsView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 50)];
    
    _forRentBoard = [[UIButton alloc] initWithFrame:CGRectMake(40, 0.0, 40, 50)];
    [_forRentBoard setBackgroundImage:[UIImage imageNamed:@"BtnForRentNormal.png"] forState:UIControlStateNormal];
    _forRentBadgeView = [[M13BadgeView alloc] initWithFrame:CGRectMake(0, 0, 15.0, 15.0)];
    _forRentBadgeView.text = @"0";
    _forRentBadgeView.hidesWhenZero = YES;
    [_forRentBoard addSubview:_forRentBadgeView];
    _forRentBadgeView.horizontalAlignment = M13BadgeViewHorizontalAlignmentRight;
    [NumBoardsView addSubview:_forRentBoard];

    
    _rentBoard = [[UIButton alloc] initWithFrame:CGRectMake(135, 0.0, 40, 50)];
    [_rentBoard setBackgroundImage:[UIImage imageNamed:@"BtnRentNormal.png"] forState:UIControlStateNormal];
    _rentBadgeView = [[M13BadgeView alloc] initWithFrame:CGRectMake(0, 0, 15.0, 15.0)];
    _rentBadgeView.text = @"0";
    _rentBadgeView.hidesWhenZero = YES;
    [_rentBoard addSubview:_rentBadgeView];
    _rentBadgeView.horizontalAlignment = M13BadgeViewHorizontalAlignmentRight;
    
    [NumBoardsView addSubview:_rentBoard];
    
    
    _secondBoard = [[UIButton alloc] initWithFrame:CGRectMake(230, 0.0, 40, 50)];
    [_secondBoard setBackgroundImage:[UIImage imageNamed:@"BtnSecondNormal.png"] forState:UIControlStateNormal];
    _secondBadgeView = [[M13BadgeView alloc] initWithFrame:CGRectMake(0, 0, 15.0, 15.0)];
    _secondBadgeView.text = @"0";
    _secondBadgeView.hidesWhenZero = YES;
    [_secondBoard addSubview:_secondBadgeView];
    _secondBadgeView.horizontalAlignment = M13BadgeViewHorizontalAlignmentRight;
  
    [NumBoardsView addSubview:_secondBoard];
    
    CSLinearLayoutItem *NumBoardsViewItem = [CSLinearLayoutItem layoutItemForView:NumBoardsView];
    NumBoardsViewItem.padding = CSLinearLayoutMakePadding(10.0, 0.0, 0.0, 0.0);
    NumBoardsViewItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:NumBoardsViewItem];
  
   
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
