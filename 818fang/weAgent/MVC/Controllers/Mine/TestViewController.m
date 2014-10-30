//
//  TestViewController.m
//  weAgent
//
//  Created by apple on 14-10-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "TestViewController.h"
#import "SurnameView.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SurnameView *name = [[SurnameView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
   
    self.title = @"测试";
    [self addBackButton];
    [self.view addSubview:name];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
