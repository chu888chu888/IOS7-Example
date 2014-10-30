//
//  RentInfo.m
//  weChat
//
//  Created by apple on 14-9-25.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "GlobalInfo.h"

@implementation GlobalInfo

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
//
}


- (void)addAdView
{
    _imagePager = [[KIImagePager alloc] init];
    _imagePager.frame = CGRectMake(0, 0, 320, 180);
    _imagePager.captionBackgroundColor = [UIColor clearColor];
    _imagePager.pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    _imagePager.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    _imagePager.slideshowTimeInterval = 5.5f;
    _imagePager.slideshowShouldCallScrollToDelegate = YES;
    
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:_imagePager];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    [self.linearLayoutView addItem:self.linearLayoutItem];
    
}
- (void)addContactView
{
    UIView *contactView = [self makePhoneView];
    
    _name = [[UILabel alloc] initWithFrame:CGRectMake(15, 7, 60, 20)];
    [_name setText:@"暂无"];
    _name.font =[UIFont fontWithName:@"Helvetica" size:16];
    _name.textColor = [UIColor blackColor];
    [contactView addSubview:_name];
    
    _phone = [[UILabel alloc] initWithFrame:CGRectMake(75, 7, 100, 20)];
    [_phone setText:@"暂无"];
    _phone.font =[UIFont fontWithName:@"Helvetica" size:15];
    _phone.textColor = [UIColor redColor];
    [contactView addSubview:_phone];
    
    _time = [[UILabel alloc] initWithFrame:CGRectMake(28, 24, 100, 20)];
    [_time setText:@"1991-2-24"];
    _time.font =[UIFont fontWithName:@"Helvetica" size:13];
    _time.textColor = [UIColor lightGrayColor];
    [contactView addSubview:_time];
    
    
    
    _givePhoneCopy = [[UIButton alloc] initWithFrame:CGRectMake(200, 10, 110, 30)];
    [_givePhoneCopy setTitle:@"拨打电话" forState:UIControlStateNormal];
    _givePhoneCopy.titleLabel.font =[UIFont fontWithName:@"Helvetica" size:16];
    [_givePhoneCopy beBlue];
    [contactView addSubview:_givePhoneCopy];
    
    
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:contactView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    [self.linearLayoutView addItem:self.linearLayoutItem];
    
    
    
    
    
    
}
- (void)addRealDetailView
{
    UIView *detailView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
    UIImageView *detailBgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
    [detailBgView setImage:[[UIImage imageNamed:@"bg_deal_bottomWaveLine"] beResize]];
    [detailView addSubview:detailBgView];
    
    //    icon_deal_dashedLine
    
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:detailView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    [self.linearLayoutView addItem:self.linearLayoutItem];
    
    
    CSLinearLayoutView *realDetailView = [[CSLinearLayoutView alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
    
    _title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 280, 20)];
    [_title setText:@"暂无标题"];
    _title.font =[UIFont fontWithName:@"Helvetica-Bold" size:15];
    //    name.textColor = [UIColor orangeColor];
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:_title];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(10.0, 0.0, 0.0, 0.0);
    
    [realDetailView addItem:self.linearLayoutItem];
    
    self.linearLayoutItem  = [self makeDashedLineViewItem];
    [realDetailView addItem:self.linearLayoutItem];
    
    
    
    [detailView addSubview:realDetailView];

}

- (void)addValidView
{
    UIView *validView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 95.0)];
    
    UIImageView *validBgView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 95.0)];
    [validBgView setImage:[[UIImage imageNamed:@"bg_hotTopicList_cell"] beResize]];
    [validView addSubview:validBgView];
    
    CSLinearLayoutView *validDetailView = [[CSLinearLayoutView alloc] initWithFrame:CGRectMake(0, 0, 300, 95.0)];
    [validView addSubview:validDetailView];
    
    
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:validView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(10.0, 0.0, 0.0, 0.0);
    [self.linearLayoutView addItem:self.linearLayoutItem];
    
    
    
    
    _validTitleView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 20.0)];
    
   
    
    UIView *validTitle = [self makeTitleView:@"可用度分析" withIconName:@"icon_deal_notice"];
    [_validTitleView addSubview:validTitle];
    
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:_validTitleView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(10.0, 0.0, 0.0, 0.0);
    [validDetailView addItem:self.linearLayoutItem];
    
    self.linearLayoutItem  = [self makeLineViewItem];
    [validDetailView addItem:self.linearLayoutItem];
    
    
    UILabel *visitLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, 70, 18)];
    visitLabel.text = @"被查看";
    visitLabel.textAlignment = NSTextAlignmentCenter;
    visitLabel.font = [UIFont baseWithSize:12];
    visitLabel.textColor = [UIColor grayColor];
    
    UILabel *collectLabel = [[UILabel alloc] initWithFrame:CGRectMake(80.0, 0.0, 70, 18)];
    collectLabel.text = @"被收藏";
    collectLabel.textAlignment = NSTextAlignmentCenter;
    collectLabel.font = [UIFont baseWithSize:12];
    collectLabel.textColor = [UIColor grayColor];
    
    UILabel *callLabel = [[UILabel alloc] initWithFrame:CGRectMake(150.0, 0.0, 70, 18)];
    callLabel.text = @"被拨打";
    callLabel.textAlignment = NSTextAlignmentCenter;
    callLabel.font = [UIFont baseWithSize:12];
    callLabel.textColor = [UIColor grayColor];
    
    UILabel *blackLabel = [[UILabel alloc] initWithFrame:CGRectMake(220.0, 0.0, 70, 18)];
    blackLabel.text = @"被举报";
    blackLabel.textAlignment = NSTextAlignmentCenter;
    blackLabel.font = [UIFont baseWithSize:12];
    blackLabel.textColor = [UIColor grayColor];
    
    UIView *validLableView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300, 18)];
    [validLableView addSubview:visitLabel];
    [validLableView addSubview:collectLabel];
    [validLableView addSubview:callLabel];
    [validLableView addSubview:blackLabel];
    
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:validLableView];
     self.linearLayoutItem.padding = CSLinearLayoutMakePadding(10.0, 0.0, 0.0, 0.0);
    [validDetailView addItem: self.linearLayoutItem];
    
    
    _visitNum = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, 70, 18)];
    _visitNum.text = @"23";
    _visitNum.textAlignment = NSTextAlignmentCenter;
    _visitNum.font = [UIFont baseWithSize:12];
    _visitNum.textColor = [UIColor baseColor];
    
    _collectNum = [[UILabel alloc] initWithFrame:CGRectMake(80.0, 0.0, 70, 18)];
    _collectNum.text = @"11";
    _collectNum.textAlignment = NSTextAlignmentCenter;
    _collectNum.font = [UIFont baseWithSize:12];
    _collectNum.textColor = [UIColor baseColor];
    
    _callNum = [[UILabel alloc] initWithFrame:CGRectMake(150.0, 0.0, 70, 18)];
    _callNum.text = @"3";
    _callNum.textAlignment = NSTextAlignmentCenter;
    _callNum.font = [UIFont baseWithSize:12];
    _callNum.textColor = [UIColor baseColor];
    
    _blackNum = [[UILabel alloc] initWithFrame:CGRectMake(220.0, 0.0, 70, 18)];
    _blackNum.text = @"1";
    _blackNum.textAlignment = NSTextAlignmentCenter;
    _blackNum.font = [UIFont baseWithSize:12];
    _blackNum.textColor = [UIColor baseColor];
    
    UIView *validNumView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300, 18)];
    [validNumView addSubview:_visitNum];
    [validNumView addSubview:_collectNum];
    [validNumView addSubview:_callNum];
    [validNumView addSubview:_blackNum];
    
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:validNumView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(5.0, 0.0, 0.0, 0.0);
    [validDetailView addItem: self.linearLayoutItem];

 
    
}


- (void)addAddressView
{
    UIView *AddressView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 90.0)];
    
    UIImageView *addressBgView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 90.0)];
    [addressBgView setImage:[[UIImage imageNamed:@"bg_hotTopicList_cell"] beResize]];
    [AddressView addSubview:addressBgView];
    
    CSLinearLayoutView *addressDetailView = [[CSLinearLayoutView alloc] initWithFrame:CGRectMake(0, 0, 300, 90)];
    [AddressView addSubview:addressDetailView];
    
    
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:AddressView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(10.0, 0.0, 0.0, 0.0);
    [self.linearLayoutView addItem:self.linearLayoutItem];
    
    UIView *addressTitleView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 20.0)];
    
    UIView *addressTitle = [self makeTitleView:@"地理位置" withIconName:@"icon_deal_merchantInfo"];
    [addressTitleView addSubview:addressTitle];
    
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:addressTitleView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(10.0, 0.0, 0.0, 0.0);
    [addressDetailView addItem:self.linearLayoutItem];
    
    self.linearLayoutItem  = [self makeLineViewItem];
    [addressDetailView addItem:self.linearLayoutItem];
    
    
    UIView *locationDetail = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 40.0)];
    
    _locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, 200, 18)];
    _locationLabel.text = @"南京西路1788号";
//    locationLabel.textAlignment = NSTextAlignmentCenter;
    _locationLabel.font = [UIFont baseWithSize:12];
//    locationLabel.textColor = [UIColor baseColor];
    [locationDetail addSubview:_locationLabel];
    
    //距离视图
    UIView *distanceView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 20.0, 150.0, 20.0)];
    
    UIImageView *distanceItemView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, 3.0, 10,10)];
    [distanceItemView setImage:[UIImage imageNamed:@"icon_deals_distance"]];

    
    UILabel *distanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(22.0, 0.0, 100, 18)];
    distanceLabel.text = @"102.3m";
//    distanceLabel.textAlignment = NSTextAlignmentCenter;
    distanceLabel.font = [UIFont baseWithSize:10];
    distanceLabel.textColor = [UIColor lightGrayColor];

    [distanceView addSubview:distanceItemView];
    [distanceView addSubview:distanceLabel];
    
    [locationDetail addSubview:distanceView];
  
    UIImageView *lineItemView = [[UIImageView alloc] initWithFrame:CGRectMake(240.0, 0.0, 1,35)];
    [lineItemView setImage:[UIImage imageNamed:@"icon_deal_verticalline"]];
    [locationDetail addSubview:lineItemView];
    
    UIImageView *goView = [[UIImageView alloc] initWithFrame:CGRectMake(250.0, 0.0, 35,35)];
    [goView setImage:[UIImage imageNamed:@"icon_homepage_masageCategory"]];
    [locationDetail addSubview:goView];

    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:locationDetail];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(10.0, 0.0, 0.0, 0.0);
    [addressDetailView addItem: self.linearLayoutItem];

}


- (void)addDescribeView
{
    UIView *describeView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 200.0)];
    
    UIImageView *describeBgView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 200.0)];
    [describeBgView setImage:[[UIImage imageNamed:@"bg_hotTopicList_cell"] beResize]];
    [describeView addSubview:describeBgView];
    
    CSLinearLayoutView *describeDetailView = [[CSLinearLayoutView alloc] initWithFrame:CGRectMake(0, 0, 300, 200.0)];
    [describeView addSubview:describeDetailView];
    
    
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:describeView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(10.0, 0.0, 0.0, 0.0);
    [self.linearLayoutView addItem:self.linearLayoutItem];
    
    UIView *describeTitleView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 20.0)];
    
    UIView *describeTitle = [self makeTitleView:@"客户描述" withIconName:@"icon_deal_package"];
    [describeTitleView addSubview:describeTitle];
    
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:describeTitleView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(10.0, 0.0, 0.0, 0.0);
    [describeDetailView addItem:self.linearLayoutItem];
    
    self.linearLayoutItem  = [self makeLineViewItem];
    [describeDetailView addItem:self.linearLayoutItem];
    
    _describe = [[UITextView alloc] initWithFrame:CGRectMake(0.0, 0.0, 280.0, 140.0)];
    _describe.text = @"暂无描述";
    _describe.font = [UIFont baseWithSize:12];
//        describe.textColor = [UIColor baseColor];
    [describeDetailView addItem:self.linearLayoutItem];
    
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:_describe];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(5.0, 0.0, 0.0, 0.0);
    [describeDetailView addItem: self.linearLayoutItem];

}



- (void)addPhoneView
{
    _phoneView = [self makePhoneView];
    _nameCopy = [[UILabel alloc] initWithFrame:CGRectMake(15, 7, 60, 20)];
    [_nameCopy setText:@"暂无"];
    _nameCopy.font =[UIFont fontWithName:@"Helvetica" size:16];
    _nameCopy.textColor = [UIColor blackColor];
    [_phoneView addSubview:_nameCopy];
    
    _phoneCopy = [[UILabel alloc] initWithFrame:CGRectMake(75, 7, 100, 20)];
    [_phoneCopy setText:@"暂无"];
    _phoneCopy.font =[UIFont fontWithName:@"Helvetica" size:15];
    _phoneCopy.textColor = [UIColor redColor];
    [_phoneView addSubview:_phoneCopy];
    
    _timeCopy = [[UILabel alloc] initWithFrame:CGRectMake(28, 24, 100, 20)];
    [_timeCopy setText:@"1991-2-24"];
    _timeCopy.font =[UIFont fontWithName:@"Helvetica" size:13];
    _timeCopy.textColor = [UIColor lightGrayColor];
    [_phoneView addSubview:_timeCopy];
    
    _givePhone = [[UIButton alloc] initWithFrame:CGRectMake(200, 10, 110, 30)];
    [_givePhone setTitle:@"拨打电话" forState:UIControlStateNormal];
    _givePhone.titleLabel.font =[UIFont fontWithName:@"Helvetica" size:16];
    [_givePhone beBlue];
    [_phoneView addSubview:_givePhone];
    [self addSubview:_phoneView];
    
}


- (void)addBlockView
{
    _blockBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 300, 30)];
    [_blockBtn beRed];
    [_blockBtn setTitle:@"屏蔽该条记录" forState:UIControlStateNormal];
    _blockBtn.titleLabel.font =[UIFont fontWithName:@"Helvetica" size:16];
    

    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:_blockBtn];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(10.0, 0.0, 0.0, 0.0);
    [self.linearLayoutView addItem:self.linearLayoutItem];
    
}

- (void)addFooterView
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    
    self.linearLayoutItem = [CSLinearLayoutItem layoutItemForView:footerView];
    self.linearLayoutItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    [self.linearLayoutView addItem:self.linearLayoutItem];
    
}


- (CSLinearLayoutItem*)makeDashedLineViewItem
{
    
    UIView *dashedLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, 1)];
    UIImage *dashLineImg =[UIImage imageNamed:@"icon_deal_dashedLine"];
    dashedLineView.backgroundColor = [UIColor colorWithPatternImage:dashLineImg];
    
    CSLinearLayoutItem *dashedLineViewItem = [CSLinearLayoutItem layoutItemForView:dashedLineView];
    dashedLineViewItem.padding = CSLinearLayoutMakePadding(10.0, 0.0, 0.0, 0.0);
    return dashedLineViewItem;
}

- (CSLinearLayoutItem*)makeLineViewItem
{
 
    UIImageView *lineView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0,1)];
    [lineView setImage:[UIImage imageNamed:@"bg_homepage_line"]];
    
    CSLinearLayoutItem *lineViewItem = [CSLinearLayoutItem layoutItemForView:lineView];
    lineViewItem.padding = CSLinearLayoutMakePadding(2.0, 0.0, 0.0, 0.0);
    
    return lineViewItem;
}


- (UIView*)makePhoneView
{
    UIView *contactView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    [bgView setImage:[UIImage imageNamed:@"bg_deal_buyAction"]];
    [contactView addSubview:bgView];
    
    
    UIImageView *clockImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 29, 11, 11)];
    [clockImageView setImage:[UIImage imageNamed:@"icon_deal_timer"]];
    [contactView addSubview:clockImageView];
    
    
    
    
    return contactView;
}

- (UIView*)makeTitleView:(NSString*)title withIconName:(NSString*)iconName
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 150.0, 20.0)];
    
    UIImageView *titleItemView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, 0.0, 14,14)];
    [titleItemView setImage:[UIImage imageNamed:iconName]];
    
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(30.0, 0.0, 120.0, 14.0)];
    titleLable.text = title;
    titleLable.font = [UIFont baseWithSize:14];
    [titleView addSubview:titleItemView];
    [titleView addSubview:titleLable];
    return titleView;

}





- (UIView*)makeStarsView:(float)rate
{
    UIView *starsView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 150.0, 20.0)];
    UIImageView *starView;
    float left = 10.0;
    int rateTemp =rate;
    
    for (int i=0; i<5; i++) {
        starView = [[UIImageView alloc] initWithFrame:CGRectMake(left, 3.0, 14,14)];
        if (rateTemp>10) {
            [starView setImage:[UIImage imageNamed:@"icon_merchant_star_full"]];
        }else if ((rateTemp<=10)&&(rateTemp>0)){
            [starView setImage:[UIImage imageNamed:@"icon_merchant_star_half"]];
        }else{
            [starView setImage:[UIImage imageNamed:@"icon_merchant_star_empty"]];
        }
        [starsView addSubview:starView];
        left+= 15.0;
        rateTemp-=20;
    }
    
    UILabel *rateLabel = [[UILabel alloc] initWithFrame:CGRectMake(left+5, 0.0, 70,20)];
    rateLabel.text = [[NSString stringWithFormat:@"%.1lf",rate] stringByAppendingString:@"%"];
    rateLabel.textColor = [UIColor orangeColor];
    rateLabel.font = [UIFont baseWithSize:15];
    [starsView addSubview:rateLabel];
    
  
    return starsView;
}


@end
