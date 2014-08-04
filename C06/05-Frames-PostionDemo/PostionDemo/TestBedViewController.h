//
//  TestBedViewController.h
//  PostionDemo
//
//  Created by chuguangming on 14-7-28.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestBedViewController : UIViewController
@property(atomic,retain) UISegmentedControl *segmentControl;
@property(atomic,retain) UIView *innerView;
@property(atomic,retain) UIView *outerView;
-(void) segmentAciton:(UISegmentedControl *)sc;
@end
