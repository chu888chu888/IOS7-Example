//
//  FKViewController.h
//  UIProgressViewTest
//
//  Created by yeeku on 13-6-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIProgressView *prog1;
@property (strong, nonatomic) IBOutlet UIProgressView *prog2;
@property (strong, nonatomic) IBOutlet UIProgressView *prog3;
- (IBAction)clicked:(id)sender;

@end
