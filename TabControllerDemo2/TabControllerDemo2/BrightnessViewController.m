//
//  BrightnessViewController.m
//  TabControllerDemo2
//
//  Created by chuguangming on 14-7-22.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "BrightnessViewController.h"

@interface BrightnessViewController ()

@end

@implementation BrightnessViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
-(BrightnessViewController *)initWithBrightness:(int)aBrightness
{
    self=[super init];
    self.brightness=aBrightness;
    self.title=[NSString stringWithFormat:@"%d%%",self.brightness*10];
    self.tabBarItem=[[UITabBarItem alloc] initWithTitle:self.title image:nil tag:0];
    return self;
}
+(id)controllerWithBrightness:(int) brightness
{
    BrightnessViewController *controller=[[BrightnessViewController alloc ] initWithBrightness:brightness];
    return controller;
}

@end
