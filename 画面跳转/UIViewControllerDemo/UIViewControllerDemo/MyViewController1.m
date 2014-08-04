//
//  MyViewController1.m
//  UIViewControllerDemo
//
//  Created by chuguangming on 14-8-4.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "MyViewController1.h"

@interface MyViewController1 ()

@end

@implementation MyViewController1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)buttonDidPush
{
    [self.view.window sendSubviewToBack:self.view];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label=[[UILabel alloc] initWithFrame:self.view.bounds];
    label.text=@"MyViewController1";
    label.textAlignment=UITextAlignmentCenter;
    label.backgroundColor=[UIColor redColor];
    label.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"画面跳转" forState:UIControlStateNormal];
    [button sizeToFit];
    CGPoint centerPoint=self.view.center;
    centerPoint.y+=50;
    button.center=centerPoint;
    button.autoresizingMask=UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [button addTarget:self action:@selector(buttonDidPush) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
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
