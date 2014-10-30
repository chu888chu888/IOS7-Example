//
//  customerHomeViewController.m
//  weChat
//
//  Created by apple on 14-9-1.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "CustomerHomeViewController.h"
#import "ForRentCustomerTableViewController.h"
#import "RentCustomerTableViewController.h"
#import "SecondCustomerTableViewController.h"
#import "CallRecordViewController.h"


@interface CustomerHomeViewController ()

@end

@implementation CustomerHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)loadView{
    self.view = [[Customer alloc] init];
    [self.view.forRentCustomer addTarget:self action:@selector(forRentCustomerHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view.rentCustomer addTarget:self action:@selector(rentCustomerHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view.secondCustomer addTarget:self action:@selector(secondCustomerHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view.callRecord addTarget:self action:@selector(callRecordHandle) forControlEvents:UIControlEventTouchUpInside];
   
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"客户"];
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)forRentCustomerHandle{
    ForRentCustomerTableViewController *forRentTVC = [[ForRentCustomerTableViewController alloc] init];
    GlobalNavigationViewController *forRentNVC = [[GlobalNavigationViewController alloc] initWithRootViewController:forRentTVC];
    [self presentViewController:forRentNVC animated:YES completion:^{}];
    
}

- (void)rentCustomerHandle{
    RentCustomerTableViewController *rentTVC = [[RentCustomerTableViewController alloc] init];
    GlobalNavigationViewController *RentNVC = [[GlobalNavigationViewController alloc] initWithRootViewController:rentTVC];
    [self presentViewController:RentNVC animated:YES completion:^{}];
    
}

- (void)secondCustomerHandle{
    SecondCustomerTableViewController *secondTVC = [[SecondCustomerTableViewController alloc] init];
    GlobalNavigationViewController *secondNVC = [[GlobalNavigationViewController alloc] initWithRootViewController:secondTVC];
    [self presentViewController:secondNVC animated:YES completion:^{}];
    
}

- (void)callRecordHandle{
    CallRecordViewController *historyTVC = [[CallRecordViewController alloc] init];
    GlobalNavigationViewController *historyNVC = [[GlobalNavigationViewController alloc] initWithRootViewController:historyTVC];
    [self presentViewController:historyNVC animated:YES completion:^{}];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
