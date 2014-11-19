//
//  FKViewController.h
//  JSONTest
//
//  Created by yeeku on 13-10-3.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController<UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)JSONSerializationParse:(id)sender;
- (IBAction)SBParse:(id)sender;
- (IBAction)JSONKitParse:(id)sender;
- (IBAction)JSONSerializationGenerate:(id)sender;
- (IBAction)SBGenerate:(id)sender;
- (IBAction)JSONKitGenerate:(id)sender;
@end
