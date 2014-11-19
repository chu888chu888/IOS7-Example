//
//  FKDetailViewController.h
//  SelectCellTest
//
//  Created by yeeku on 13-6-18.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *detailField;
@property (strong, nonatomic) NSIndexPath*	editingIndexPath;
-(IBAction)clicked:(id)sender;
- (IBAction)finished:(id)sender;
@end
