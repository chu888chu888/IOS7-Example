//
//  LoginViewController.m
//  weChat
//
//  Created by apple on 14-8-21.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "LoginViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



-(void)loadView{
    self.view = [[Login alloc] init];
    [self.view.loginBtn addTarget:self action:@selector(loginHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view.registerBtn addTarget:self action:@selector(registerHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view.findBtn addTarget:self action:@selector(findPasswordHandle) forControlEvents:UIControlEventTouchUpInside];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"登录";
}


- (void)loginHandle{
   
    
    DSJSONRPCCompletionHandler completionHandler = ^(NSString *methodName, NSInteger callId, id methodResult, DSJSONRPCError *methodError, NSError *internalError) {
        
        
        [[NSUserDefaults standardUserDefaults] setObject:[[methodResult objectForKey:@"result"] objectForKey:@"diploma"] forKey:@"diploma"];

        [self backHandle];

    };
    
    // Store generated call id to match up responses·
    NSDictionary *certificate = [NSDictionary dictionaryWithObjectsAndKeys:self.view.nameText.text,@"username",self.view.passwordText.text,@"password",nil];
 
    
    [self RPCUseClass:@"Sessions" callMethodName:@"create" withParameters:certificate onCompletion:completionHandler];
    
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
