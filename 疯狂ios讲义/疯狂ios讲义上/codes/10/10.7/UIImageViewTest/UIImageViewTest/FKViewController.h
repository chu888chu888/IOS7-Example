//
//  FKViewController.h
//  UIImageViewTest
//
//  Created by yeeku on 13-6-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *iv;
@property (strong, nonatomic) IBOutlet UIImageView *iv2;
- (IBAction)plus:(id)sender;
- (IBAction)minus:(id)sender;
- (IBAction)next:(id)sender;
@end
