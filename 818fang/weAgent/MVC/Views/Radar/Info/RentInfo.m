//
//  RentInfo.m
//  weChat
//
//  Created by apple on 14-9-25.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "RentInfo.h"

@implementation RentInfo

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
    UIView *detailView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 280)];
    UIImageView *detailBgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 280)];
    [detailBgView setImage:[[UIImage imageNamed:@"bg_deal_bottomWaveLine"] beResize]];
    [detailView addSubview:detailBgView];
    
    //    icon_deal_dashedLine
    
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:detailView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    [self.linearLayoutView addItem:self.linearLayoutItem];
    
    
    CSLinearLayoutView *realDetailView = [[CSLinearLayoutView alloc] initWithFrame:CGRectMake(0, 0, 300, 280)];
    
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

    UIView *payTypeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
    UILabel *payTypeLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 150, 20)];
    [payTypeLable setText:@"-> 支付类型 :"];
    payTypeLable.font =[UIFont baseWithSize:12];
    _payType = [[UILabel alloc] initWithFrame:CGRectMake(95, 0, 150, 20)];
    [_payType setText:@"暂无资料"];
    _payType.font =[UIFont baseWithSize:12];
    [payTypeView addSubview:payTypeLable];
    [payTypeView addSubview:_payType];
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:payTypeView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    [realDetailView addItem:self.linearLayoutItem];
    
    UIView *rentTypeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
    UILabel *rentTypeLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 150, 20)];
    [rentTypeLable setText:@"-> 出租类型 :"];
    rentTypeLable.font =[UIFont baseWithSize:12];
    _rentType = [[UILabel alloc] initWithFrame:CGRectMake(95, 0, 150, 20)];
    [_rentType setText:@"暂无资料"];
    _rentType.font =[UIFont baseWithSize:12];
    [rentTypeView addSubview:rentTypeLable];
    [rentTypeView addSubview:_rentType];
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:rentTypeView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    [realDetailView addItem:self.linearLayoutItem];
    
    UIView *areaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
    UILabel *areaLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 150, 20)];
    [areaLable setText:@"-> 住房面积 :"];
    areaLable.font =[UIFont baseWithSize:12];
    _area = [[UILabel alloc] initWithFrame:CGRectMake(95, 0, 150, 20)];
    [_area setText:@"暂无资料"];
    _area.font =[UIFont baseWithSize:12];
    [areaView addSubview:areaLable];
    [areaView addSubview:_area];
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:areaView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    [realDetailView addItem:self.linearLayoutItem];
    
    UIView *decorateView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
    UILabel *decorateLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 150, 20)];
    [decorateLable setText:@"-> 装修程度 :"];
    decorateLable.font =[UIFont baseWithSize:12];
    _decorate = [[UILabel alloc] initWithFrame:CGRectMake(95, 0, 150, 20)];
    [_decorate setText:@"暂无资料"];
    _decorate.font =[UIFont baseWithSize:12];
    [decorateView addSubview:decorateLable];
    [decorateView addSubview:_decorate];
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:decorateView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    [realDetailView addItem:self.linearLayoutItem];
    
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
    UILabel *baseLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 150, 20)];
    [baseLable setText:@"-> 基础设施 :"];
    baseLable.font =[UIFont baseWithSize:12];
    _base = [[UILabel alloc] initWithFrame:CGRectMake(95, 0, 150, 20)];
    [_base setText:@"暂无资料"];
    _base.font =[UIFont baseWithSize:12];
    [baseView addSubview:baseLable];
    [baseView addSubview:_base];
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:baseView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    [realDetailView addItem:self.linearLayoutItem];
    
    UIView *roomTypeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
    UILabel *roomTypeLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 150, 20)];
    [roomTypeLable setText:@"-> 住房户型 :"];
    roomTypeLable.font =[UIFont baseWithSize:12];
    _roomType = [[UILabel alloc] initWithFrame:CGRectMake(95, 0, 150, 20)];
    [_roomType setText:@"暂无资料"];
    _roomType.font =[UIFont baseWithSize:12];
    [roomTypeView addSubview:roomTypeLable];
    [roomTypeView addSubview:_roomType];
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:roomTypeView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    [realDetailView addItem:self.linearLayoutItem];
    
    UIView *directionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
    UILabel *directionLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 150, 20)];
    [directionLable setText:@"-> 住房朝向 :"];
    directionLable.font =[UIFont baseWithSize:12];
    _direction = [[UILabel alloc] initWithFrame:CGRectMake(95, 0, 150, 20)];
    [_direction setText:@"暂无资料"];
    _direction.font =[UIFont baseWithSize:12];
    [directionView addSubview:directionLable];
    [directionView addSubview:_direction];
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:directionView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    [realDetailView addItem:self.linearLayoutItem];
    
    UIView *floorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
    UILabel *floorLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 150, 20)];
    [floorLable setText:@"-> 所在楼层 :"];
    floorLable.font =[UIFont baseWithSize:12];
    _floor = [[UILabel alloc] initWithFrame:CGRectMake(95, 0, 150, 20)];
    [_floor setText:@"暂无资料"];
    _floor.font =[UIFont baseWithSize:12];
    [floorView addSubview:floorLable];
    [floorView addSubview:_floor];
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:floorView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    [realDetailView addItem:self.linearLayoutItem];
    
    UIView *houseTypeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
    UILabel *houseTypeLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 150, 20)];
    [houseTypeLable setText:@"-> 房屋类型 :"];
    houseTypeLable.font =[UIFont baseWithSize:12];
    _houseType = [[UILabel alloc] initWithFrame:CGRectMake(95, 0, 150, 20)];
    [_houseType setText:@"暂无资料"];
    _houseType.font =[UIFont baseWithSize:12];
    [houseTypeView addSubview:houseTypeLable];
    [houseTypeView addSubview:_houseType];
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:houseTypeView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    [realDetailView addItem:self.linearLayoutItem];

    
    
    [detailView addSubview:realDetailView];
    
}

@end
