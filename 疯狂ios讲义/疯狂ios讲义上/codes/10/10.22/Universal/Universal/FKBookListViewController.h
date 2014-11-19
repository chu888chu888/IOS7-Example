//
//  FKBookListViewController.h
//  Books
//
//  Created by yeeku on 13-2-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FKDetailViewController.h"

@interface FKBookListViewController : UITableViewController

@property (weak , nonatomic) FKDetailViewController *detailViewController;

@end
