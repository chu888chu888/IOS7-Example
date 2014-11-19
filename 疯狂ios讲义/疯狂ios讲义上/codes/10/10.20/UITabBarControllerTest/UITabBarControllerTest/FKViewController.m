//
//  FKViewController.m
//  UITabBarControllerTest
//
//  Created by yeeku on 13-6-29.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController

-(id)initWithNibName:(NSString *)nibNameOrNil
	bundle:(NSBundle *)nibBundleOrNil
{
	if ([super initWithNibName:nibNameOrNil bundle:nibBundleOrNil] != nil)
	{
		// 为该控制器设置标签项
		self.tabBarItem = [[UITabBarItem alloc]
			initWithTitle:@"作者信息"
			image:[UIImage imageNamed:@"user.gif"] tag:2];
	}
	return self;
}
- (void)viewDidLoad
{
	[super viewDidLoad];
}
@end
