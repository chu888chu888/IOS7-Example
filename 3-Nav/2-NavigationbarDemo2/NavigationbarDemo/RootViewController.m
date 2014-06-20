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
    //自定义UIBarButtonItem
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(leftItemEvent)];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    UIButton *item=[UIButton buttonWithType:UIButtonTypeInfoLight];
    [item setTitle:@"  test" forState:UIControlStateNormal];
    //item.backgroundColor=[UIColor redColor];
    [item setFrame:CGRectMake(0, 0, 80, 35)];
    [item addTarget:self action:@selector(rightItemEvent) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc] initWithCustomView:item];
    self.navigationItem.rightBarButtonItem=rightItem;
    
    
}
-(void) rightItemEvent
{
    UIActionSheet *actionSheet=[[UIActionSheet alloc] initWithTitle:@"这是一个测试" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"确定", nil];
    [actionSheet showInView:self.view];
}
-(void) leftItemEvent
{
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"study" message:@"study" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
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
