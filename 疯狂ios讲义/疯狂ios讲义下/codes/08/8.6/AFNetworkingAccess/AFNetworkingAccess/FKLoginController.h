//
//  FKLoginController.h
//  AFNetworkingAccess
//
//  Created by yeeku on 13-10-4.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKLoginController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *passField;
- (IBAction)loginBnClicked:(id)sender;
- (IBAction)finishEdit:(id)sender;

@end
