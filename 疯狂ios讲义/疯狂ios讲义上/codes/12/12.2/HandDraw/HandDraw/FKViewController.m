//
//  FKViewController.m
//  HandDraw
//
//  Created by yeeku on 13-7-11.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "FKDrawView.h"

@interface FKViewController ()

@end

@implementation FKViewController
NSArray* colors;
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	colors = [NSArray arrayWithObjects:
		[UIColor redColor],[UIColor greenColor],
		[UIColor blueColor],[UIColor yellowColor],
		[UIColor purpleColor],[UIColor cyanColor],
		[UIColor blackColor] , nil];
}
- (IBAction)changeColor:(UISegmentedControl*)sender {
	// 根据用户的选择来修改FKDrawView的当前颜色
	((FKDrawView*)self.view).currentColor = [colors objectAtIndex:
		sender.selectedSegmentIndex];
}
- (IBAction)changeShape:(UISegmentedControl*)sender
{
	// 修改FKDrawView控件的shape属性
	((FKDrawView*)self.view).shape = sender.selectedSegmentIndex;
}

@end
