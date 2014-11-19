//
//  FKViewController.h
//  MoveCellTest
//
//  Created by yeeku on 13-6-18.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController<UITableViewDataSource,
	UITableViewDelegate , UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *table;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *addBn;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *deleteBn;

- (IBAction) toggleEdit:(id)sender;
@end
