//
//  MyViewController3.h
//  UIViewControllerDemo
//
//  Created by chuguangming on 14-8-13.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyViewController1.h"
#import "UIKitPrjSectionTableViewController.h"
@interface MyViewController3 : UITableViewController
@property(nonatomic,retain) NSMutableArray *dataSource;
@property(nonatomic,retain) UIKitPrjSectionTableViewController *mv;
@end
