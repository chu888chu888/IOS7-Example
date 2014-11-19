//
//  FKViewController.h
//  GDataXMLWrite
//
//  Created by yeeku on 13-10-1.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *idField;
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *authorField;
@property (strong, nonatomic) IBOutlet UITextField *remarkField;
- (IBAction)finishEdit:(id)sender;
- (IBAction)add:(id)sender;
@end
