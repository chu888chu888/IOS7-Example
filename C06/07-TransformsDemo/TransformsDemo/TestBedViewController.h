//
//  TestBedViewController.h
//  TransformsDemo
//
//  Created by chuguangming on 14-7-29.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestBedViewController : UIViewController
@property(nonatomic,retain) NSTimer *timer;
@property(nonatomic) int theta;
@property(nonatomic,retain) UIImageView *imageView;

- (void) move: (NSTimer *) aTimer;
- (void) start: (id) sender;
- (void) stop: (id) sender;

@end
