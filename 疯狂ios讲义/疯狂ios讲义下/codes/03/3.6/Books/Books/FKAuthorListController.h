//
//  FKAuthorListController.h
//  Books
//
//  Created by yeeku on 13-8-30.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKAuthorListController : UITableViewController<UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *deleteBn;
- (IBAction)toggleDelete:(id)sender;
@end
