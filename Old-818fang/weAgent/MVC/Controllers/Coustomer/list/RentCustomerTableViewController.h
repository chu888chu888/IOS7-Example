//
//  RentCustomerTableViewController.h
//  weChat
//
//  Created by apple on 14-9-2.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//


#import "GlobalViewController.h"
#import "MJRefresh.h"
#import "UIimageView+AFNetworking.h"

@interface RentCustomerTableViewController : GlobalViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic) UITableView *view;
@end