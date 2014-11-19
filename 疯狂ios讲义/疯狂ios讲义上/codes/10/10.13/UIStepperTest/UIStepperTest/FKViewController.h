//
//  FKViewController.h
//  UIStepperTest
//
//  Created by yeeku on 13-6-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *tf1;
@property (strong, nonatomic) IBOutlet UITextField *tf2;
@property (strong, nonatomic) IBOutlet UITextField *tf3;
@property (strong, nonatomic) IBOutlet UIStepper *stepper;
- (IBAction)valueChanged:(UIStepper*)sender;

@end
