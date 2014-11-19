//
//  FKViewController.m
//  UITextFieldTest
//
//  Created by yeeku on 13-6-4.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)finishEdit:(id)sender {

	// sender放弃作为第一响应者
	[sender resignFirstResponder];
}
- (IBAction)backTap:(id)sender {
	// 让passField控件放弃作为第一响应者
	[self.passField resignFirstResponder];
	// 让nameField控件放弃作为第一响应者
	[self.nameField resignFirstResponder];
}
@end
