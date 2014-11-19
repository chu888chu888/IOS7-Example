//
//  FKViewController.h
//  UIDatePickerTest
//
//  Created by yeeku on 13-6-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)clicked:(id)sender;

@end
