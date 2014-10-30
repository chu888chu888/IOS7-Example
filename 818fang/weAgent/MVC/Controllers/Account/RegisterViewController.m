//
//  RegisterViewController.m
//  weChat
//
//  Created by apple on 14-8-21.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)loadView{

    self.view = [[Register alloc] init];
    [self.view.codeBtn addTarget:self action:@selector(codeHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view.registerBtn addTarget:self action:@selector(registerHandle) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"注册";
    
    

    // Do any additional setup after loading the view.
}

- (void)codeHandle
{
    DSJSONRPC *_jsonRPC = [[DSJSONRPC alloc] initWithServiceEndpoint:[NSURL URLWithString:@"http://localhost/android/Home/Tenants"]];
    
    // We're going to use a standard completion handler for our json-rpc calls
    DSJSONRPCCompletionHandler completionHandler = ^(NSString *methodName, NSInteger callId, id methodResult, DSJSONRPCError *methodError, NSError *internalError) {
        if (methodError) {
            NSLog(@"\nMethod %@(%i) returned an error: %@\n\n", methodName, callId, methodError);
        }
        else if (internalError) {
            NSLog(@"\nMethod %@(%i) couldn't be sent with error: %@\n\n", methodName, callId, internalError);
        }
        else {
            NSLog(@"\nMethod %@(%i) completed with result: %@\n\n", methodName, callId, methodResult);
        }
        
    };
    
    NSDictionary *requestPhone = [NSDictionary dictionaryWithObjectsAndKeys:self.view.phoneText.text ,@"requestPhone",nil];
    
    [_jsonRPC callMethod:@"captcha" withParameters:[self formatToJsonString:requestPhone] onCompletion:completionHandler];
}

- (void)registerHandle
{
    
    DSJSONRPC *_jsonRPC = [[DSJSONRPC alloc] initWithServiceEndpoint:[NSURL URLWithString:@"http://localhost/android/Home/Tenants"]];
    
    // We're going to use a standard completion handler for our json-rpc calls
    DSJSONRPCCompletionHandler completionHandler = ^(NSString *methodName, NSInteger callId, id methodResult, DSJSONRPCError *methodError, NSError *internalError) {
        if (methodError) {
            NSLog(@"\nMethod %@(%i) returned an error: %@\n\n", methodName, callId, methodError);
        }
        else if (internalError) {
            NSLog(@"\nMethod %@(%i) couldn't be sent with error: %@\n\n", methodName, callId, internalError);
        }
        else {
            NSLog(@"\nMethod %@(%i) completed with result: %@\n\n", methodName, callId, methodResult);
        }
        
    };
    
    // Store generated call id to match up responses·
    NSDictionary *certificate = [NSDictionary dictionaryWithObjectsAndKeys:self.view.phoneText.text,@"phone",self.view.codeText.text,@"code",self.view.passwordText.text,@"password",self.view.passwordAgainText.text,@"passwordAgain",nil];
    
    
    
    // Example of a method call with no parameters that returns a string representation of the current time
    [_jsonRPC callMethod:@"create" withParameters:[self formatToJsonString:certificate] onCompletion:completionHandler];
    
    
    
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
