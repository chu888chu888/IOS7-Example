//
//  FKViewController.h
//  Swap
//
//  Created by yeeku on 13-7-22.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *vertical;
@property (strong, nonatomic) IBOutlet UIView *horizontal;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageViews;
- (IBAction)first:(id)sender;
- (IBAction)prev:(id)sender;
- (IBAction)next:(id)sender;
- (IBAction)last:(id)sender;
@end
