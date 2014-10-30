//
//  CustomeServiceViewController.m
//  weChat
//
//  Created by apple on 14-9-2.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "CustomeServiceViewController.h"


@interface CustomeServiceViewController ()

@end

@implementation CustomeServiceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)loadView{
//    NSMutableString *UIView = [NSMutableString stringWithFormat:@"%@",self.class];
//    [UIView replaceCharactersInRange:[UIView rangeOfString:@"ViewController"] withString:@"UIView"];
//    NSLog(@"%@",UIView);
    self.view = [[CustomeService alloc] init];


    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"客户服务"];
    // Do any additional setup after loading the view.
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(backHandle)];
    
    [self.navigationItem setLeftBarButtonItem:leftButton];
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
