//
//  FKViewController.h
//  XibCellTest
//
//  Created by yeeku on 13-6-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController <UITableViewDataSource
	, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *table;

@end
