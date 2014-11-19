//
//  FKEventListController.h
//  CoreDataTest
//
//  Created by yeeku on 13-9-1.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKEventListController : UITableViewController
@property (strong, nonatomic) IBOutlet UIBarButtonItem *deleteBn;
- (IBAction)toggleDelete:(id)sender;
@end
