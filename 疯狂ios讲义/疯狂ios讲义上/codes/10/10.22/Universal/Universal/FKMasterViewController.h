//
//  FKMasterViewController.h
//  Books
//
//  Created by yeeku on 13-2-9.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FKDetailViewController.h"

@interface FKMasterViewController : UITableViewController

@property (strong, nonatomic) FKDetailViewController *detailViewController;

@end
