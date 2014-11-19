//
//  FKViewController.h
//  SendSms
//
//  Created by yeeku on 13-10-23.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *destField;
@property (strong, nonatomic) IBOutlet UITextField *contentField;
- (IBAction)send:(id)sender;

@end
