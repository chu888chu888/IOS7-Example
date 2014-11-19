//
//  FKViewController.h
//  UISegmentedControlTest2
//
//  Created by yeeku on 13-6-7.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment;
@property (strong, nonatomic) IBOutlet UITextField *tv;
- (IBAction)add:(id)sender;
- (IBAction)remove:(id)sender;


@end
