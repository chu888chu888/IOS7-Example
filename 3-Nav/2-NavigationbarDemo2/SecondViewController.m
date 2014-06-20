//
//  SecondViewController.m
//  NavigationbarDemo
//
//  Created by chuguangming on 14-5-14.
//  Copyright (c) 2014年 chuguangming. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Second";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void) loadView
{
    UIView *baseView=[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    baseView.backgroundColor=[UIColor blueColor];
    self.view=baseView;
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"hidevc" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(90, 100, 140, 35)];
    button.backgroundColor=[UIColor redColor];
    [button addTarget:self action:@selector(hidevc) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *backbutton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backbutton setTitle:@"backvc" forState:UIControlStateNormal];
    [backbutton setFrame:CGRectMake(90, 150, 140, 35)];
    backbutton.backgroundColor=[UIColor redColor];
    [backbutton addTarget:self action:@selector(backvc) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backbutton];
    
    UIButton *thirdButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [thirdButton setTitle:@"third" forState:UIControlStateNormal];
    [thirdButton setFrame:CGRectMake(90, 200, 140, 35)];
    thirdButton.backgroundColor=[UIColor redColor];
    [thirdButton addTarget:self action:@selector(gotoThird) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thirdButton];
    
    //自定义titleView
    UIView *testView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    testView.backgroundColor=[UIColor orangeColor];
    self.navigationItem.titleView=testView;
    //自定义rightItem
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc] initWithTitle:@"自定义" style:UIBarButtonItemStyleBordered target:self action:nil];
    self.navigationItem.rightBarButtonItem=rightItem;
    
}
-(void)gotoThird
{

}
-(void) hidevc
{
    if(self.navigationController.toolbarHidden)
    {
        [self.navigationController setToolbarHidden:NO animated:YES];
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
    else
    {
        [self.navigationController setToolbarHidden:YES animated:NO];
        [self.navigationController setNavigationBarHidden:YES animated:NO];
    }
}
-(void) backvc
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
