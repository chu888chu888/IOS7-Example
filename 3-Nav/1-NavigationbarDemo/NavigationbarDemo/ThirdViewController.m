//
//  ThirdViewController.m
//  NavigationbarDemo
//
//  Created by chuguangming on 14-5-15.
//  Copyright (c) 2014年 chuguangming. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Third";
    }
    return self;
}
-(void)loadView
{
    UIView *baseview=[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    baseview.backgroundColor=[UIColor blueColor];
    self.view=baseview;
    
    UIButton * pushButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pushButton setTitle:@"push" forState:UIControlStateNormal];
    [pushButton setFrame:CGRectMake(90, 100, 140, 35)];
    pushButton.backgroundColor=[UIColor redColor];
    [pushButton addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    
    UIButton *popButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [popButton setTitle:@"pop" forState:UIControlStateNormal];
    [popButton setFrame:CGRectMake(90, 150, 140, 35)];
    popButton.backgroundColor=[UIColor redColor];
    [popButton addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:popButton];
    
    UIButton *rootButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [rootButton setTitle:@"root" forState:UIControlStateNormal];
    [rootButton setFrame:CGRectMake(90, 200, 140, 35)];
    rootButton.backgroundColor=[UIColor redColor];
    [rootButton addTarget:self action:@selector(root) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rootButton];
    
    UIButton *indexButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [indexButton setTitle:@"indexButton" forState:UIControlStateNormal];
    [indexButton setFrame:CGRectMake(90, 250, 140, 35)];
    indexButton.backgroundColor=[UIColor redColor];
    [indexButton addTarget:self action:@selector(index) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:indexButton];
    
     
    
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
#pragma mark -Target Action
-(void) push
{
    ThirdViewController *thirdVC=[[ThirdViewController alloc] init];
    [self.navigationController pushViewController:thirdVC animated:YES];

    
}
-(void) pop
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void) root
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void) index
{
    UIViewController *secondVC=[[self.navigationController viewControllers] objectAtIndex:0];
    [self.navigationController popToViewController:secondVC animated:YES];
}
@end
