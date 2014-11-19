//
//  FKRootViewController.h
//  Weather
//
//  Created by yeeku on 13-10-6.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FKCitiesViewController.h"

// 实现CitysViewControllerDelegate协议,作为代理完成改变data中的值
@interface FKRootViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,FKCitiesViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
