//
//  GlobalViewController.m
//  weChat
//
//  Created by apple on 14-8-21.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "GlobalViewController.h"


@interface GlobalViewController ()

@end

@implementation GlobalViewController




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
    _home = [NSDictionary dictionaryWithObjectsAndKeys:@"121.485352",@"longitude",@"31.214243",@"latitude",nil];
    _beforeDay = @"3";
    _distance = @"3000";
    
   self.edgesForExtendedLayout = UIRectEdgeNone;
    _jsonRPC = [DSJSONRPC alloc];
     _jsonRPC.delegate = self;
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
- (void)RPCUseClass:(NSString *)ClassName callMethodName:(NSString *)methodName withParameters:(NSDictionary *)parameters onCompletion:(DSJSONRPCCompletionHandler)completionHandler {
    _jsonRPC = [_jsonRPC initWithServiceEndpoint:[NSURL URLWithString:[@"http://121.42.43.165/Home/" stringByAppendingString:ClassName]]];
   
    // Example of a method call with no parameters that returns a string representation of the current time
    [_jsonRPC callMethod:methodName withParameters:[self formatToJsonString:parameters] onCompletion:completionHandler];
    
}

- (BOOL)beforeDoMethodCheckTheResult:(id)methodResult
{
    NSString *code = [methodResult objectForKey:@"code"];

    if ([code isEqualToString:@"000101"]||[code isEqualToString:@"000102"]||[code isEqualToString:@"000103"]) {
       [self loginHandle];
       return false;
    }
    return true;
   

}

- (void)afterDidMethodCheckTheResult{
//    NSLog(@"mamamam");

}

@end
