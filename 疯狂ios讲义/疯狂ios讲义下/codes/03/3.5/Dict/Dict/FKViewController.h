//
//  FKViewController.h
//  Dict
//
//  Created by yeeku on 13-8-27.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *wordField;
@property (strong, nonatomic) IBOutlet UITextField *detailField;
@property (strong, nonatomic) IBOutlet UITextField *keyField;
- (IBAction)finishEdit:(id)sender;
- (IBAction)addWord:(id)sender;
@end
