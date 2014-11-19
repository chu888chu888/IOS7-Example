//
//  FKViewController.h
//  AsyncChatClient
//
//  Created by yeeku on 13-9-19.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncSocket.h"

@interface FKViewController : UIViewController <AsyncSocketDelegate>
@property (strong, nonatomic) IBOutlet UITextView *showView;
@property (strong, nonatomic) IBOutlet UITextField *inputField;
- (IBAction)finishEdit:(id)sender;
- (IBAction)send:(id)sender;
@end
