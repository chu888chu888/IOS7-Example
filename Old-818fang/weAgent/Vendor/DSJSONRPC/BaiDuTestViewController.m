//
//  BaiDuTestViewController.m
//  weChat
//
//  Created by apple on 14-8-22.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#define MYBUNDLE_NAME @ "mapapi.bundle"
#define MYBUNDLE_PATH [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: MYBUNDLE_NAME]
#define MYBUNDLE [NSBundle bundleWithPath: MYBUNDLE_PATH]

#import "BaiDuTestViewController.h"
#import "SecondHousesTableViewController.h"

@interface BaiDuTestViewController (){


}

@end

@implementation BaiDuTestViewController




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
    //背景图
    //    [self.view setBackgroundColor:[UIColor whiteColor]];
    //    UIImageView *loginImgTips = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_tips.png"]];
    //    loginImgTips.frame = CGRectMake(33, 31, 255, 135);
    //    [self.view addSubview:loginImgTips];
    //
    
    
//    //搜索
//    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    searchBtn.frame = CGRectMake(10, 60, 300, 30);
//    [searchBtn setTitle:@"雷达搜索" forState:UIControlStateNormal];
//    //    [loginBtn setBackgroundImage:[UIImage imageNamed:@"Button_login.png"] forState:UIControlStateNormal];
//    //    [loginBtn setBackgroundImage:[UIImage imageNamed:@"Button_login@2x.png"] forState:UIControlStateHighlighted];
//    [searchBtn addTarget:self action:@selector(searchBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:searchBtn];
//    
//    
//    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 100, 320, 240)];
//    [self.view addSubview:_mapView];
//    
//    //求租搜索
//    UIButton *ForRentBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    ForRentBtn.frame = CGRectMake(10, 360, 100, 30);
//    [ForRentBtn setTitle:@"求租信息" forState:UIControlStateNormal];
//    
//    [ForRentBtn addTarget:self action:@selector(searchBtnClick) forControlEvents:UIControlEventTouchUpInside];
//       [self.view addSubview:ForRentBtn];
//    
//    //出租搜索
//    UIButton *rentBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    rentBtn.frame = CGRectMake(110, 360, 100, 30);
//    [rentBtn setTitle:@"出租信息" forState:UIControlStateNormal];
//    //    [loginBtn setBackgroundImage:[UIImage imageNamed:@"Button_login.png"] forState:UIControlStateNormal];
//    //    [loginBtn setBackgroundImage:[UIImage imageNamed:@"Button_login@2x.png"] forState:UIControlStateHighlighted];
//    [rentBtn addTarget:self action:@selector(searchBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:rentBtn];
//    
//    //二手房搜索
//    UIButton *secondHandBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    secondHandBtn.frame = CGRectMake(210, 360, 100, 30);
//    [secondHandBtn setTitle:@"二手房信息" forState:UIControlStateNormal];
//    //    [loginBtn setBackgroundImage:[UIImage imageNamed:@"Button_login.png"] forState:UIControlStateNormal];
//    //    [loginBtn setBackgroundImage:[UIImage imageNamed:@"Button_login@2x.png"] forState:UIControlStateHighlighted];
//    [secondHandBtn addTarget:self action:@selector(SecondHandBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:secondHandBtn];
//    
//    
//    forRentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 400, 100, 30)];
//    forRentLabel.text = @"0";
//    [self.view addSubview:forRentLabel];
//
//    rentLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 400, 100, 30)];
//    rentLabel.text = @"0";
//    [self.view addSubview:rentLabel];
//
//    secondHandLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 400, 100, 30)];
//    secondHandLabel.text = @"0";
//    [self.view addSubview:secondHandLabel];
//
    
    
}




- (void)viewDidLoad
{
    
    [super viewDidLoad];
//    [self addJsonRpcHandle];
//    [self addView];
//   
    // Do any additional setup after loading the view.
}

- (void)addJsonRpcHandle
{
    
    //将self变成弱引用，打破retain cycle
    BaiDuTestViewController *blockSelf = self;

    _forRentCompletionHandlerp = ^(NSString *methodName, NSInteger callId, id methodResult, DSJSONRPCError *methodError, NSError *internalError) {
        
       [blockSelf->forRentLabel setText:[methodResult objectForKey:@"result"]];
    };
    

    _rentCompletionHandler = ^(NSString *methodName, NSInteger callId, id methodResult, DSJSONRPCError *methodError, NSError *internalError) {
        [blockSelf->rentLabel setText:[methodResult objectForKey:@"result"]];
    };
    
    _secondHandCompletionHandler = ^(NSString *methodName, NSInteger callId, id methodResult, DSJSONRPCError *methodError, NSError *internalError) {
        [blockSelf->secondHandLabel setText:[methodResult objectForKey:@"result"]];
    };
    
}

- (void)ForRentBtnClick{
    
    
    
}

- (void)RentBtnClick{
    
}

- (void)SecondHandBtnClick{
    SecondHousesTableViewController *SecondHousesVC = [[SecondHousesTableViewController alloc] init];
    [self.navigationController pushViewController:SecondHousesVC animated:YES];
    
}




- (void)searchBtnClick
{
    NSDictionary *home = [NSDictionary dictionaryWithObjectsAndKeys:@"121.485352",@"longitude",@"31.214243",@"latitude",nil];
    
    NSDictionary *condition = [NSDictionary dictionaryWithObjectsAndKeys:@"40885bf63696eb9bbcdd45b1dc30a33d",@"diploma",home,@"home",@"0",@"moneyRange",@"3",@"beforeDay",@"1000",@"distance",nil];
    
    DSJSONRPC *_jsonRPC = [[DSJSONRPC alloc] initWithServiceEndpoint:[NSURL URLWithString:@"http://localhost/android/Home/Wanted"]];
   
    // We're going to use a standard completion handler for our json-rpc calls
    
    [_jsonRPC callMethod:@"getRadarNum" withParameters:[self formatToJsonString:condition] onCompletion:_forRentCompletionHandlerp];
    
    _jsonRPC = [[DSJSONRPC alloc] initWithServiceEndpoint:[NSURL URLWithString:@"http://localhost/android/Home/RentResources"]];
    
    [_jsonRPC callMethod:@"getRadarNum" withParameters:[self formatToJsonString:condition] onCompletion:_rentCompletionHandler];

     _jsonRPC = [[DSJSONRPC alloc] initWithServiceEndpoint:[NSURL URLWithString:@"http://localhost/android/Home/SecondHouses"]];
    
    [_jsonRPC callMethod:@"getRadarNum" withParameters:[self formatToJsonString:condition] onCompletion:_secondHandCompletionHandler];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [_mapView viewWillAppear];
//    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
//}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    [_mapView viewWillDisappear];
//    _mapView.delegate = nil; // 不用时，置nil
//}

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
