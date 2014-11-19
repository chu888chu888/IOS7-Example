//
//  FKUpdateViewController.h
//  SettingsTest
//
//  Created by yeeku on 13-8-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKUpdateViewController : UIViewController
@property (strong, nonatomic) IBOutlet UISlider *soundSlider;
@property (strong, nonatomic) IBOutlet UISwitch *lightSwitch;
- (IBAction)soundChanged:(id)sender;
- (IBAction)lightChanged:(id)sender;
@end
