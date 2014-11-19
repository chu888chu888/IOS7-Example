//
//  FKViewController.m
//  DrawTextTest
//
//  Created by yeeku on 13-7-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "FKTextView.h"

@interface FKViewController ()

@end

@implementation FKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
}
- (IBAction)scaleChanged:(id)sender
{
	// 修改FKTextView的scaleRate属性
	((FKTextView*)self.view).scaleRate = ((UISlider*)sender).value;
}
- (IBAction)rotateChanged:(id)sender
{
	// 修改FKTextView的rotateAngle属性
	((FKTextView*)self.view).rotateAngle = ((UISlider*)sender).value;
}
@end
