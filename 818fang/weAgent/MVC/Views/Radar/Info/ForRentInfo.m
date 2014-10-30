//
//  ForRentInfo.m
//  weChat
//
//  Created by apple on 14-9-29.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "ForRentInfo.h"

@implementation ForRentInfo

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //           [self initialize];
    }
    return self;
}


- (void) initialize
{
    
    self.linearLayoutView.backgroundColor = [UIColor baseBackgroundColor];
    [self addAdView];
    [self addContactView];
    [self addRealDetailView];
    
    
    [self addValidView];
    [self addAddressView];
    [self addDescribeView];
    
    [self addPhoneView];
      [self addBlockView];
    [self addFooterView];
    
}


- (void)addRealDetailView
{
    UIView *detailView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 140)];
    UIImageView *detailBgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 140)];
    [detailBgView setImage:[[UIImage imageNamed:@"bg_deal_bottomWaveLine"] beResize]];
    [detailView addSubview:detailBgView];
    
    //    icon_deal_dashedLine
    
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:detailView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    [self.linearLayoutView addItem:self.linearLayoutItem];
    
    
    CSLinearLayoutView *realDetailView = [[CSLinearLayoutView alloc] initWithFrame:CGRectMake(0, 0, 300, 140)];
    
    self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 280, 20)];
    [self.title setText:@"暂无标题"];
    self.title.font =[UIFont fontWithName:@"Helvetica-Bold" size:15];
    //    name.textColor = [UIColor orangeColor];
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:self.title];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(10.0, 0.0, 0.0, 0.0);
    [realDetailView addItem:self.linearLayoutItem];
    
    self.linearLayoutItem  = [self makeDashedLineViewItem];
    [realDetailView addItem:self.linearLayoutItem];
    
    
    UIView *publishTypeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
    UILabel *publishTypeLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 150, 20)];
    [publishTypeLable setText:@"-> 发布类型 :"];
    publishTypeLable.font =[UIFont baseWithSize:12];
    _publishType = [[UILabel alloc] initWithFrame:CGRectMake(95, 0, 150, 20)];
    [_publishType setText:@"暂无资料"];
    _publishType.font =[UIFont baseWithSize:12];
    [publishTypeView addSubview:publishTypeLable];
    [publishTypeView addSubview:_publishType];
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:publishTypeView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(5.0, 0.0, 0.0, 0.0);
    [realDetailView addItem:self.linearLayoutItem];
    
    UIView *expectMoneyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
    UILabel *expectMoneyLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 150, 20)];
    [expectMoneyLable setText:@"-> 期望租金 :"];
    expectMoneyLable.font =[UIFont baseWithSize:12];
    _expectMoney = [[UILabel alloc] initWithFrame:CGRectMake(95, 0, 150, 20)];
    [_expectMoney setText:@"暂无资料"];
    _expectMoney.font =[UIFont baseWithSize:12];
    [expectMoneyView addSubview:expectMoneyLable];
    [expectMoneyView addSubview:_expectMoney];
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:expectMoneyView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    [realDetailView addItem:self.linearLayoutItem];
    
    UIView *expectTimeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
    UILabel *expectTimeLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 150, 20)];
    [expectTimeLable setText:@"-> 期望入住时间 :"];
    expectTimeLable.font =[UIFont baseWithSize:12];
    _expectTime = [[UILabel alloc] initWithFrame:CGRectMake(115, 0, 150, 20)];
    [_expectTime setText:@"暂无资料"];
    _expectTime.font =[UIFont baseWithSize:12];
    [expectTimeView addSubview:expectTimeLable];
    [expectTimeView addSubview:_expectTime];
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:expectTimeView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    [realDetailView addItem:self.linearLayoutItem];
    
    UIView *expectHouseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
    UILabel *expectHouseLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 150, 20)];
    [expectHouseLable setText:@"-> 期望户型 :"];
    expectHouseLable.font =[UIFont baseWithSize:12];
    _expectHouse = [[UILabel alloc] initWithFrame:CGRectMake(95, 0, 150, 20)];
    [_expectHouse setText:@"暂无资料"];
    _expectHouse.font =[UIFont baseWithSize:12];
    [expectHouseView addSubview:expectHouseLable];
    [expectHouseView addSubview:_expectHouse];
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:expectHouseView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    [realDetailView addItem:self.linearLayoutItem];
    
    
    
    [detailView addSubview:realDetailView];
    
}

@end
