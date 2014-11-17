//
//  GlobalInfoViewController.m
//  weChat
//
//  Created by apple on 14-9-29.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "GlobalInfoViewController.h"

@interface GlobalInfoViewController ()

@end

@implementation GlobalInfoViewController

//以房子的id进行初始化
- (id)initWithId:(NSString*)showID
{
    if ((self = [super init])) {
        self.showId = showID;
        
        [self initialize];
    }
    return self;
}

//加载到数据后初始化接口
-(void) initialize{
}

//一系列得初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.imagePager.dataSource = self;
    self.view.imagePager.delegate = self;
    self.view.linearLayoutView.delegate = self;
    
    [self.view.givePhone addTarget:self action:@selector(givePhoneHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view.givePhoneCopy addTarget:self action:@selector(givePhoneHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view.blockBtn addTarget:self action:@selector(blockHandle) forControlEvents:UIControlEventTouchUpInside];
    
    self.collectButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_merchant_collect"] style:UIBarButtonItemStyleDone target:self action:@selector(collectIt)];
    
    self.collectedButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_merchant_collect_selected"] style:UIBarButtonItemStyleDone target:self action:@selector(discollectIt)];
    self.view.phoneView.hidden = YES;
    self.photoArray = [[NSMutableArray array] init];
    
   
    
    // Do any additional setup after loading the view.
}

//等待加载数据
- (void)viewWillAppear:(BOOL)animated{
    self.loadingView = [[LoadingView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.loadingView];
    [self initialize];
}

//处理内存泄露
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//收藏函数
- (void)collectIt{
    NSDictionary *condition = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"diploma"],@"diploma",self.showId,@"houseId",self.typeId,@"typeId",nil];
    
    DSJSONRPCCompletionHandler completionHandler = ^(NSString *methodName, NSInteger callId, id methodResult, DSJSONRPCError *methodError, NSError *internalError) {
        
        if ([[methodResult objectForKey:@"code"] isEqualToString:@"070700"]) {
            
            self.followId =[[methodResult objectForKey:@"result"] stringValue];
            self.navigationItem.rightBarButtonItem=self.collectedButton;
            self.promptAlert = [[UIAlertView alloc] initWithTitle:@"提示:" message:@"添加收藏成功!" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
            
            [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(removeInfo) userInfo:self.promptAlert repeats:NO];
        }else{
            self.promptAlert = [[UIAlertView alloc] initWithTitle:@"提示:" message:@"添加收藏失败!" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
            
            [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(removeInfo) userInfo:self.promptAlert repeats:NO];
            
        }
        [self.promptAlert show];
        
    };
    
    [self RPCUseClass:@"Follow" callMethodName:@"createFollow" withParameters:condition onCompletion:completionHandler];
    
    
}

//取消收藏
- (void)discollectIt{
    NSDictionary *condition = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"diploma"],@"diploma",self.followId,@"id",nil];
    
    DSJSONRPCCompletionHandler completionHandler = ^(NSString *methodName, NSInteger callId, id methodResult, DSJSONRPCError *methodError, NSError *internalError) {
        
        if ([[methodResult objectForKey:@"code"] isEqualToString:@"070800"]) {
            self.navigationItem.rightBarButtonItem=self.collectButton;
            self.promptAlert = [[UIAlertView alloc] initWithTitle:@"提示:" message:@"取消收藏成功!" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
            
            [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(removeInfo) userInfo:self.promptAlert repeats:NO];
        }else{
            self.promptAlert = [[UIAlertView alloc] initWithTitle:@"提示:" message:@"取消收藏失败!" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
            
            [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(removeInfo) userInfo:self.promptAlert repeats:NO];
            
        }
        [self.promptAlert show];
        
    };
    
    [self RPCUseClass:@"Follow" callMethodName:@"deleteFollow" withParameters:condition onCompletion:completionHandler];
}

//拨打电话
-(void)givePhoneHandle{
    NSDictionary *condition = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"diploma"],@"diploma",self.showId,@"houseId",self.typeId,@"typeId",nil];
    
    DSJSONRPCCompletionHandler completionHandler = ^(NSString *methodName, NSInteger callId, id methodResult, DSJSONRPCError *methodError, NSError *internalError) {
        NSLog(@"%@",[methodResult objectForKey:@"message"]);
    };
    
    [self RPCUseClass:@"Call" callMethodName:@"createCall" withParameters:condition onCompletion:completionHandler];
    
}

//拉黑处理
-(void)blockHandle{
    self.promptAlert = [[UIAlertView alloc] initWithTitle:@"提示:" message:@"举报后，将推出该界面，是否确认举报!" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
    [self.promptAlert addButtonWithTitle:@"举报"];
    [self.promptAlert show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
   if (buttonIndex == 1) {
       NSDictionary *condition = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"diploma"],@"diploma",self.showId,@"houseId",self.typeId,@"typeId",nil];
       
       DSJSONRPCCompletionHandler completionHandler = ^(NSString *methodName, NSInteger callId, id methodResult, DSJSONRPCError *methodError, NSError *internalError) {
           [self.navigationController popToRootViewControllerAnimated:YES];
       };
       
       [self RPCUseClass:@"Block" callMethodName:@"createBlock" withParameters:condition onCompletion:completionHandler];
   }
    
}

//协议，返回轮播图片
- (NSArray *) arrayWithImages
{
    return self.photoArray;
}

//返回图片模式
- (UIViewContentMode) contentModeForImage:(NSUInteger)image
{
    return UIViewContentModeScaleAspectFill;
}

//默认图片
- (UIImage *) placeHolderImageForImagePager{
    return [UIImage imageNamed:@"no_picture"];
}




#pragma UIScrollView
//滚动图片
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.view.linearLayoutView.contentOffset.y >= 180) {
        self.view.phoneView.hidden = NO;
    }else {
        self.view.phoneView.hidden = YES;
    }
}

@end
