//
//  HomeViewController.m
//  weChat
//
//  Created by apple on 14-8-22.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark addView
- (void)addView
{

    
    
    //登录
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginBtn.frame = CGRectMake(37, 180, 117, 37);
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setTag:101];
    [self.view addSubview:loginBtn];
    
    //注册
    UIButton *registerBtn  = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    registerBtn.frame = CGRectMake(167, 180, 117, 37);
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];

    [registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [registerBtn setTag:102];
    [self.view addSubview:registerBtn];
   
    
    
    UIButton *btnPhone = [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
    
    btnPhone.frame = CGRectMake(80,70,100,30);
    
     [btnPhone setTitle:@"拨打电话" forState:UIControlStateNormal];
    
    // 点击拨号按钮直接拨号
    
    [btnPhone addTarget:self action:@selector(callAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnPhone];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addView];
    NSUserDefaults *UserInfo=[NSUserDefaults standardUserDefaults];

    
    NSLog(@"\nMethod %@\n\n",[UserInfo objectForKey:@"diploma"]);
    // Do any additional setup after loading the view.
}

- (void)callAction{
    NSString *phoneNum = @"15952014986";// 电话号码
    NSUserDefaults *UserInfo=[NSUserDefaults standardUserDefaults];
    
    
    NSLog(@"\nMethod %@\n\n",[UserInfo objectForKey:@"diploma"]);

    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNum]];
    
    if ( !phoneCallWebView ) {
        
        phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];// 这个webView只是一个后台的容易 不需要add到页面上来  效果跟方法二一样 但是这个方法是合法的
        
    }
    
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
    
}

- (void)loginBtnClick
{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:^{}];
}

- (void)registerBtnClick
{
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [self presentViewController:registerVC animated:YES completion:^{}];
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
