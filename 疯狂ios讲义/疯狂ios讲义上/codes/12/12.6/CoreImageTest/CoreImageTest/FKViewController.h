//
//  FKViewController.h
//  CoreImageTest
//
//  Created by yeeku on 13-7-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *iv;
@property (strong, nonatomic) IBOutlet UISlider *slider1;
@property (strong, nonatomic) IBOutlet UISlider *slider2;
@property (strong, nonatomic) IBOutlet UISlider *slider3;
@property (strong, nonatomic) IBOutlet UISlider *slider4;
- (IBAction)sliderChange1:(id)sender;
- (IBAction)sliderChange2:(id)sender;
- (IBAction)sliderChange3:(id)sender;
- (IBAction)sliderChange4:(id)sender;
- (IBAction)reset:(id)sender;
- (IBAction)load:(id)sender;
- (IBAction)save:(id)sender;
@end
