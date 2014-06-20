//
//  MasterViewController.h
//  SimpleTableDemo
//
//  Created by chuguangming on 14-6-20.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain,readwrite) NSArray *tableNameData;
@property(nonatomic,retain,readwrite) NSArray *tableAgeData;
@property(nonatomic,retain,readwrite) NSArray *tableHeadImageData;


@end
