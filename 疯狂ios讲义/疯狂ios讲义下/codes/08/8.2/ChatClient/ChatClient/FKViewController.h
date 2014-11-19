//
//  FKViewController.h
//  ChatClient
//
//  Created by yeeku on 13-9-18.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *inputField;
@property (strong, nonatomic) IBOutlet UITextView *showView;
- (IBAction)finishEdit:(id)sender;
- (IBAction)send:(id)sender;
@end
