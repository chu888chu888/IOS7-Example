//
//  SecondHousesTableViewController.h
//  weChat
//
//  Created by apple on 14-8-27.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "GlobalViewController.h"
#import "MJRefresh.h"
#import "UIimageView+AFNetworking.h"

@interface SecondHousesTableViewController : GlobalViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic) UITableView *view;
@end

