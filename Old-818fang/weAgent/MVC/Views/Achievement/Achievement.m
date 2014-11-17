//
//  Achievement.m
//  weChat
//
//  Created by apple on 14-9-23.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "Achievement.h"

@implementation Achievement

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
    [self addRateView];
    [self addGraphView];
    [self addNumView];
       
}

- (void)addRateView{
    UIView *rateView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 160)];
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,160)];
    [bgImageView setImage:[UIImage imageNamed:@"bg_my_show_frame"]];
    [rateView addSubview:bgImageView];
    
    CSLinearLayoutItem *rateViewGraphItem = [CSLinearLayoutItem layoutItemForView:rateView];
    rateViewGraphItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    rateViewGraphItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:rateViewGraphItem];
    
    CSLinearLayoutView *rateLinearView = [[CSLinearLayoutView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 160)];
    rateLinearView.orientation = CSLinearLayoutViewOrientationVertical;
    [rateView addSubview:rateLinearView];
    
    UILabel *dayRateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 240, 12)];
    dayRateLabel.text = @"今日您联系的客户数量";
    dayRateLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    CSLinearLayoutItem *dayRateLabelItem = [CSLinearLayoutItem layoutItemForView:dayRateLabel];
    dayRateLabelItem.padding = CSLinearLayoutMakePadding(20.0, 10.0, 0.0, 0.0);
    dayRateLabelItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentLeft;
    [rateLinearView addItem:dayRateLabelItem];
    
    UILabel *dayRate = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 240, 24)];
    dayRate.text = @"超过了其他           的用户";
    dayRate.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    dayRate.textColor = [UIColor baseColor];
    
    _dayRateData = [[UILabel alloc] initWithFrame:CGRectMake(89.0,-4.0, 70, 28)];
    _dayRateData.textColor = [UIColor orangeColor];
    _dayRateData.textAlignment = NSTextAlignmentRight;
    _dayRateData.text = @"90%";
    _dayRateData.font = [UIFont fontWithName:@"Helvetica-Bold" size:28];
    [dayRate addSubview:_dayRateData];
    
    
    CSLinearLayoutItem *dayRateItem = [CSLinearLayoutItem layoutItemForView:dayRate];
    dayRateItem.padding = CSLinearLayoutMakePadding(10.0, 10.0, 0.0, 0.0);
    dayRateItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentLeft;
    [rateLinearView addItem:dayRateItem];
    
    
    UILabel *monthRateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 240, 12)];
    monthRateLabel.text = @"本月您累计联系的客户数量";
    monthRateLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    CSLinearLayoutItem *monthRateLabelItem = [CSLinearLayoutItem layoutItemForView:monthRateLabel];
    monthRateLabelItem.padding = CSLinearLayoutMakePadding(20.0, 10.0, 0.0, 0.0);
    monthRateLabelItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentLeft;
    [rateLinearView addItem:monthRateLabelItem];
    
    UILabel *monthRate = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 240, 24)];
    monthRate.text = @"超过了其他           的用户";
    monthRate.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    monthRate.textColor = [UIColor baseColor];
    
    _monthRateData = [[UILabel alloc] initWithFrame:CGRectMake(89.0,-4.0, 70, 28)];
    _monthRateData.textColor = [UIColor orangeColor];
    _monthRateData.textAlignment = NSTextAlignmentRight;
    _monthRateData.text = @"90%";
    _monthRateData.font = [UIFont fontWithName:@"Helvetica-Bold" size:28];
    [monthRate addSubview:_monthRateData];
    
    CSLinearLayoutItem *monthRateItem = [CSLinearLayoutItem layoutItemForView:monthRate];
    monthRateItem.padding = CSLinearLayoutMakePadding(10.0, 10.0, 0.0, 0.0);
    monthRateItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentLeft;
    [rateLinearView addItem:monthRateItem];
}
- (void)addGraphView
{
    UILabel *graphTitle = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 18)];
    graphTitle.text = @"近期客户量走势图";
    graphTitle.textAlignment = NSTextAlignmentCenter;
    graphTitle.font = [UIFont baseWithSize:16];
    graphTitle.textColor = [UIColor baseColor];
    
    CSLinearLayoutItem *graphTitleItem = [CSLinearLayoutItem layoutItemForView:graphTitle];
    graphTitleItem.padding = CSLinearLayoutMakePadding(10.0, 10.0, 0.0, 0.0);
    graphTitleItem.horizontalAlignment = CSLinearLayoutItemVerticalAlignmentCenter;
    [self.linearLayoutView addItem:graphTitleItem];
    
    


    
    
    _achievementGraph = [[BEMSimpleLineGraphView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 180)];
    _achievementGraph.colorTop = [UIColor baseColor];
    _achievementGraph.colorBottom = [UIColor baseColor];
    _achievementGraph.colorLine = [UIColor whiteColor];
    _achievementGraph.colorXaxisLabel = [UIColor whiteColor];
    _achievementGraph.colorYaxisLabel = [UIColor whiteColor];
    _achievementGraph.widthLine = 3.0;
    _achievementGraph.enableTouchReport = YES;
    _achievementGraph.enablePopUpReport = YES;
    _achievementGraph.enableBezierCurve = NO;
    _achievementGraph.enableYAxisLabel = YES;
    _achievementGraph.autoScaleYAxis = YES;
    _achievementGraph.alwaysDisplayDots = NO;
    _achievementGraph.enableReferenceAxisLines = YES;
    _achievementGraph.enableReferenceAxisFrame = YES;
    _achievementGraph.animationGraphStyle = BEMLineAnimationDraw;
    
   
    CSLinearLayoutItem *achievementGraphItem = [CSLinearLayoutItem layoutItemForView:_achievementGraph];
    achievementGraphItem.padding = CSLinearLayoutMakePadding(10.0, 0.0, 0.0, 0.0);
    achievementGraphItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:achievementGraphItem];

    
}

- (void)addNumView
{
    
    UILabel *thisWeek = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 18)];
    thisWeek.text = @"本周";
    thisWeek.textAlignment = NSTextAlignmentCenter;
    thisWeek.font = [UIFont baseWithSize:16];
    thisWeek.textColor = [UIColor baseColor];
   
    UILabel *today = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 0.0, 100, 18)];
    today.text = @"今日";
    today.textAlignment = NSTextAlignmentCenter;
    today.font = [UIFont baseWithSize:16];
    today.textColor = [UIColor baseColor];
   
    UILabel *total = [[UILabel alloc] initWithFrame:CGRectMake(200.0, 0.0, 100, 18)];
    total.text = @"总计";
    total.textAlignment = NSTextAlignmentCenter;
    total.font = [UIFont baseWithSize:16];
    total.textColor = [UIColor baseColor];
    
    UIView *numLableView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300, 18)];
    [numLableView addSubview:thisWeek];
    [numLableView addSubview:today];
    [numLableView addSubview:total];

    CSLinearLayoutItem *numLableViewItem = [CSLinearLayoutItem layoutItemForView:numLableView];
    numLableViewItem.padding = CSLinearLayoutMakePadding(20.0, 0.0, 0.0, 0.0);
    numLableViewItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:numLableViewItem];

    
    
    _thisWeekNum = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 18)];
    _thisWeekNum.text = @"200";
    _thisWeekNum.textAlignment = NSTextAlignmentCenter;
    _thisWeekNum.font = [UIFont baseWithSize:16];
    _thisWeekNum.textColor = [UIColor orangeColor];
    
    _todayNum = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 0.0, 100, 18)];
    _todayNum.text = @"10";
    _todayNum.textAlignment = NSTextAlignmentCenter;
    _todayNum.font = [UIFont baseWithSize:16];
    _todayNum.textColor = [UIColor orangeColor];
    
    _totalNum = [[UILabel alloc] initWithFrame:CGRectMake(200.0, 0.0, 100, 18)];
    _totalNum.text = @"1000";
    _totalNum.textAlignment = NSTextAlignmentCenter;
    _totalNum.font = [UIFont baseWithSize:16];
    _totalNum.textColor = [UIColor orangeColor];
    
    UIView *numView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300, 18)];
    [numView addSubview:_thisWeekNum];
    [numView addSubview:_todayNum];
    [numView addSubview:_totalNum];
    
    CSLinearLayoutItem *numViewItem = [CSLinearLayoutItem layoutItemForView:numView];
    numViewItem.padding = CSLinearLayoutMakePadding(0.0, 0.0, 0.0, 0.0);
    numViewItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:numViewItem];
    
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
