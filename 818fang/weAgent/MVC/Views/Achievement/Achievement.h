//
//  Achievement.h
//  weChat
//
//  Created by apple on 14-9-23.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "GlobalUIView.h"
#import "BEMSimpleLineGraphView.h"

@interface Achievement : GlobalUIView
@property (strong, nonatomic) BEMSimpleLineGraphView *achievementGraph;
@property (strong, nonatomic) UILabel *dayRateData;
@property (strong, nonatomic) UILabel *monthRateData;
@property (strong, nonatomic) UILabel *thisWeekNum;
@property (strong, nonatomic) UILabel *todayNum;
@property (strong, nonatomic) UILabel *totalNum;
@end
