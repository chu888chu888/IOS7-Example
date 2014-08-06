//
//  TestBedViewController.h
//  ImagePickerDemo
//
//  Created by chuguangming on 14-7-30.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestBedViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIPopoverControllerDelegate>
@property(nonatomic,retain) UIImageView *imageView;
@property(nonatomic,retain) UIPopoverController *popoverController;
@property(nonatomic,retain) UIImagePickerController *imagePickerController;
@property(nonatomic,retain) UISwitch *editSwitch;

-(CGPoint) CGRectGetCenter:(CGRect)rect;
-(void)pickImage:(id)sender;
@end
