//
//  MineHomeViewController.h
//  weChat
//
//  Created by apple on 14-9-1.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "GlobalViewController.h"
#import "IntroduceViewController.h"

@interface MineHomeViewController : GlobalViewController <NextViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic) UITableView *view;
@end
