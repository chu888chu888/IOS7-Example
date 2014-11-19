//
//  FKProvincesViewController.h
//  Weather
//
//  Created by yeeku on 13-10-6.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FKRootViewController.h"
#import "FKCitiesViewController.h"

@interface FKProvincesViewController : UITableViewController
// 定义包含省份的数组
@property (strong,nonatomic) NSArray *provinces;
// 定义根视图控制器实例，用于为FKCitysViewController设置代理
@property (strong,nonatomic) FKRootViewController *rootInstance;
@end
