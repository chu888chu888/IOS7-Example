//
//  FKViewController.h
//  LocationTest
//
//  Created by yeeku on 13-10-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *longitudeTxt;
@property (strong, nonatomic) IBOutlet UITextField *latitudeTxt;
@property (strong, nonatomic) IBOutlet UITextField *altitudeTxt;
@property (strong, nonatomic) IBOutlet UITextField *speedTxt;
@property (strong, nonatomic) IBOutlet UITextField *courseTxt;
- (IBAction)bnTapped:(id)sender;
@end
