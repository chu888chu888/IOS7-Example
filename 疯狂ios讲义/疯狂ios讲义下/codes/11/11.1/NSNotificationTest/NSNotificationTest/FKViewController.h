//
//  FKViewController.h
//  NSNotificationTest
//
//  Created by yeeku on 13-11-4.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIProgressView *prog;
@property (strong, nonatomic) IBOutlet UIButton *bn;
- (IBAction)start:(id)sender;
@end
