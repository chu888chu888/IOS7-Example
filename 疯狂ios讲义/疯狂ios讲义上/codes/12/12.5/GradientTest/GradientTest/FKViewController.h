//
//  FKViewController.h
//  GradientTest
//
//  Created by yeeku on 13-7-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)changeType:(id)sender;
- (IBAction)beforeStart:(id)sender;
- (IBAction)afterEnd:(id)sender;
@end
