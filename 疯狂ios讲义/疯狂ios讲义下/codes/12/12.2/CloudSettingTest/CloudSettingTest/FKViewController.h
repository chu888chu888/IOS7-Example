//
//  FKViewController.h
//  SettingsTest
//
//  Created by yeeku on 13-11-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *passField;
@property (strong, nonatomic) IBOutlet UISwitch *musicSwitch;
@property (strong, nonatomic) IBOutlet UISlider *speedSlider;
- (IBAction)musicChanged:(id)sender;
- (IBAction)speedChanged:(id)sender;
@end
