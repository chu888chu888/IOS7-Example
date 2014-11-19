//
//  FKViewController.h
//  UITextFieldTest
//
//  Created by yeeku on 13-6-4.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *passField;

- (IBAction)finishEdit:(id)sender;
- (IBAction)backTap:(id)sender;

@end
