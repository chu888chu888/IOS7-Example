//
//  FKViewController.h
//  UIButtonTest
//
//  Created by yeeku on 13-6-2.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *bn1;
@property (strong, nonatomic) IBOutlet UIButton *bn2;

- (IBAction)disabledClicked:(id)sender;

@end
