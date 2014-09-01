//
//  CustomerMasterViewController.h
//  AppDemo
//
//  Created by chuguangming on 14-9-1.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomerMasterViewController : UITableViewController
@property(nonatomic,retain) NSMutableArray *dataSource;
@property(nonatomic,retain) NSMutableArray *images;
@property(nonatomic,retain,readwrite) NSArray *tableNameData;
@property(nonatomic,retain,readwrite) NSArray *tableAgeData;
@property(nonatomic,retain,readwrite) NSArray *tableHeadImageData;
@property(nonatomic,retain,readwrite) NSArray *tableDesc;
@end
