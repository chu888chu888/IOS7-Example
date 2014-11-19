//
//  FKViewController.h
//  HelloiOS
//
//  Created by yeeku on 13-5-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *loginBn;
@property (strong, nonatomic) IBOutlet UILabel *myTxt;
- (IBAction)clickHandler:(UIButton *)sender;

@end
