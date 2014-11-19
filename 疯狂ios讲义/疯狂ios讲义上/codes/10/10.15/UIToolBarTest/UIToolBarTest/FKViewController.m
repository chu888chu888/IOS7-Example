//
//  FKViewController.m
//  UIToolBarTest
//
//  Created by yeeku on 13-6-14.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
}
- (IBAction)clicked:(id)sender {
	// 使用UIAlertView显示用户点击了哪个按钮
	NSString* msg = [NSString stringWithFormat:@"您点击了【%@】按钮"
		, [sender title]];
	UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示"
		message:msg
		delegate:nil
		cancelButtonTitle:@"确定"
		otherButtonTitles: nil];
	[alert show];
}
@end
