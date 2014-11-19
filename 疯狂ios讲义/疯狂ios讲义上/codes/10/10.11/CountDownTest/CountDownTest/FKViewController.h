//
//  FKViewController.h
//  CountDownTest
//
//  Created by yeeku on 13-6-11.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *startBn;
@property (strong, nonatomic) IBOutlet UIDatePicker *countDown;
- (IBAction)clicked:(id)sender;

@end
