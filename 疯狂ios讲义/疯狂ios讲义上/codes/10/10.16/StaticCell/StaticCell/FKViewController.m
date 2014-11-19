//
//  FKInfoViewController.m
//  StaticCell
//
//  Created by yeeku on 13-7-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.label1.text = @"作者的图书";
	self.label2.text = @"作者简历";
	self.iv.image = [UIImage imageNamed:@"stars.gif"];
}
@end
