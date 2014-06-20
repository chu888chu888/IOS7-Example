//
//  RootViewController.m
//  NavigationbarDemo
//
//  Created by chuguangming on 14-5-14.
//  Copyright (c) 2014年 chuguangming. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"root";
    }
    return self;
}
-(void) loadView
{
    UIView *baseView=[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    baseView.backgroundColor=[UIColor purpleColor];
    self.view=baseView;
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"push" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(90, 100, 140, 35)];
    button.backgroundColor=[UIColor blueColor];
    [button addTarget:self action:@selector(pushvc) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void) pushvc
{
    SecondViewController *secondVC=[[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
