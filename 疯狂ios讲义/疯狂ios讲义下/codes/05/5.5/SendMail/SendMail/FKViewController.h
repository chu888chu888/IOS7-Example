//
//  FKViewController.h
//  SendMail
//
//  Created by yeeku on 13-10-23.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *toField;
@property (strong, nonatomic) IBOutlet UITextField *ccField;
@property (strong, nonatomic) IBOutlet UITextField *bccField;
@property (strong, nonatomic) IBOutlet UITextField *subjectField;
@property (strong, nonatomic) IBOutlet UITextField *contentField;
- (IBAction)sendMail:(id)sender;
- (IBAction)finishEdit:(id)sender;
@end
