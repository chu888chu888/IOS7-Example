//
//  FKViewController.h
//  MotionManagerTest
//
//  Created by yeeku on 13-10-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *accelerometerLabel;
@property (strong, nonatomic) IBOutlet UILabel *gyroLabel;
@property (strong, nonatomic) IBOutlet UILabel *magnetometerLabel;

@end
