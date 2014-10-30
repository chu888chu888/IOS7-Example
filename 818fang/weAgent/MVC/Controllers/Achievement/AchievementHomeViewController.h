//
//  achievementHomeViewController.h
//  weChat
//
//  Created by apple on 14-9-1.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "GlobalViewController.h"
#import "Achievement.h"

@interface AchievementHomeViewController : GlobalViewController <BEMSimpleLineGraphDataSource,BEMSimpleLineGraphDelegate>

@property (nonatomic) Achievement *view;
@property (strong, nonatomic) NSMutableArray *ArrayOfValues;
@property (strong, nonatomic) NSMutableArray *ArrayOfDates;

@end
