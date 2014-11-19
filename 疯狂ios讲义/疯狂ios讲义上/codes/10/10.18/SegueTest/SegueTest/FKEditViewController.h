//
//  FKEditViewController.h
//  SegueTest
//
//  Created by yeeku on 13-7-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKEditViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *tv;
@property (nonatomic, copy) NSString* editContent;
@end
