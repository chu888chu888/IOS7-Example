//
//  RentInfoViewController.m
//  weChat
//
//  Created by apple on 14-9-1.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "ForRentInfoViewController.h"


@interface ForRentInfoViewController ()

@end


@implementation ForRentInfoViewController

-(void) initialize{
    
    NSDictionary *condition = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"diploma"],@"diploma",self.showId,@"id",nil];
    
    DSJSONRPCCompletionHandler completionHandler = ^(NSString *methodName, NSInteger callId, id methodResult, DSJSONRPCError *methodError, NSError *internalError) {
        
        [self.photoArray removeAllObjects];
        
        [self.photoArray addObjectsFromArray:[[methodResult objectForKey:@"result"] objectForKey:@"pic_url"]];
        [self.view.imagePager reloadData];
        //初始化公共的数据
        self.view.name.text =[[methodResult objectForKey:@"result"] objectForKey:@"name"];
        self.view.phone.text =[[methodResult objectForKey:@"result"] objectForKey:@"phone"];
        
        self.view.nameCopy.text =[[methodResult objectForKey:@"result"] objectForKey:@"name"];
        self.view.phoneCopy.text =[[methodResult objectForKey:@"result"] objectForKey:@"phone"];

        self.view.time.text =[[methodResult objectForKey:@"result"] objectForKey:@"publishtime"];
        self.view.timeCopy.text =[[methodResult objectForKey:@"result"] objectForKey:@"publishtime"];
        
         self.view.title.text =[[methodResult objectForKey:@"result"] objectForKey:@"page_title"];
        self.view.locationLabel.text =[[methodResult objectForKey:@"result"] objectForKey:@"address"];
        
        self.view.visitNum.text =[[methodResult objectForKey:@"result"] objectForKey:@"click_num"];
        self.view.collectNum.text =[[methodResult objectForKey:@"result"] objectForKey:@"collect_num"];
        self.view.callNum.text =[[methodResult objectForKey:@"result"] objectForKey:@"call_num"];
        self.view.blackNum.text =[[methodResult objectForKey:@"result"] objectForKey:@"block_num"];
        
        UIView *startView = [self.view makeStarsView:[[[methodResult objectForKey:@"result"] objectForKey:@"trust_degree"] floatValue]];
        startView.frame = CGRectMake(150.0, -5.0, 150, 20);
        [self.view.validTitleView addSubview:startView];

        //初始化私有部分数据
        self.view.publishType.text =[[methodResult objectForKey:@"result"] objectForKey:@"publishtype"];
        self.view.expectMoney.text =[[methodResult objectForKey:@"result"] objectForKey:@"rent"];
        self.view.expectTime.text =[[methodResult objectForKey:@"result"] objectForKey:@"excepttime"];
        self.view.expectHouse.text =[[methodResult objectForKey:@"result"] objectForKey:@"housetype"];
        
        if ([[[methodResult objectForKey:@"result"] objectForKey:@"discribe"] isKindOfClass:[NSString class]]) {
             self.view.describe.text =[[methodResult objectForKey:@"result"] objectForKey:@"discribe"];
        }
        
        if([[[[methodResult objectForKey:@"result"] objectForKey:@"isCollect"] stringValue] isEqualToString:@"1"]){
            self.followId = [[methodResult objectForKey:@"result"] objectForKey:@"collectId"];
            NSLog(@"%@",self.followId);
            
            self.navigationItem.rightBarButtonItem=self.collectedButton;
        }else{
            self.navigationItem.rightBarButtonItem=self.collectButton;
            
        }
        
        [self.loadingView removeFromSuperview];
        
    };
    [self RPCUseClass:@"Wanted" callMethodName:@"getSingleInfo" withParameters:condition onCompletion:completionHandler];
    
}

- (void)loadView{
    self.view = [[ForRentInfo alloc] init];
    self.typeId = @"1";
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"求租详情"];
    
}


@end
