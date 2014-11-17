//
//  RentInfoViewController.m
//  weChat
//
//  Created by apple on 14-9-1.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "RentInfoViewController.h"


@interface RentInfoViewController ()

@end


@implementation RentInfoViewController

-(void) initialize{
    
    NSDictionary *condition = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"diploma"],@"diploma",self.showId,@"id",nil];

    DSJSONRPCCompletionHandler completionHandler = ^(NSString *methodName, NSInteger callId, id methodResult, DSJSONRPCError *methodError, NSError *internalError) {
        [self.photoArray removeAllObjects];

        //增加图片
          NSString *houseType= [[[methodResult objectForKey:@"result"] objectForKey:@"house_type"] substringToIndex:1];
        if ([[[methodResult objectForKey:@"result"] objectForKey:@"pic_url"] count] != 0) {
            [self.photoArray addObjectsFromArray:[[methodResult objectForKey:@"result"] objectForKey:@"pic_url"]];
        }else{
            if ([houseType isEqualToString:@"1"]) {
                [self.photoArray addObject:[UIImage imageNamed:@"one_room"]];
            }else if([houseType isEqualToString:@"2"]){
                [self.photoArray addObject:[UIImage imageNamed:@"two_room"]];
            }else if([houseType isEqualToString:@"3"]){
                [self.photoArray addObject:[UIImage imageNamed:@"three_room"]];
            }else{
                [self.photoArray addObject:[UIImage imageNamed:@"no_picture"]];
            }
            
        }

        
        [self.view.imagePager reloadData];
        //初始化公共的数据
        self.view.name.text =[[methodResult objectForKey:@"result"] objectForKey:@"name"];
        self.view.phone.text =[[methodResult objectForKey:@"result"] objectForKey:@"phone"];
        
        self.view.nameCopy.text =[[methodResult objectForKey:@"result"] objectForKey:@"name"];
        self.view.phoneCopy.text =[[methodResult objectForKey:@"result"] objectForKey:@"phone"];
        
        self.view.time.text =[[methodResult objectForKey:@"result"] objectForKey:@"publish_time"];
        self.view.timeCopy.text =[[methodResult objectForKey:@"result"] objectForKey:@"publish_time"];
        
        self.view.title.text =[[methodResult objectForKey:@"result"] objectForKey:@"page_title"];
        self.view.locationLabel.text =[[methodResult objectForKey:@"result"] objectForKey:@"address"];
        
         self.view.describe.text =[[methodResult objectForKey:@"result"] objectForKey:@"discribe"];
        
        self.view.visitNum.text =[[methodResult objectForKey:@"result"] objectForKey:@"click_num"];
        self.view.collectNum.text =[[methodResult objectForKey:@"result"] objectForKey:@"collect_num"];
        self.view.callNum.text =[[methodResult objectForKey:@"result"] objectForKey:@"call_num"];
        self.view.blackNum.text =[[methodResult objectForKey:@"result"] objectForKey:@"block_num"];
        
        UIView *startView = [self.view makeStarsView:[[[methodResult objectForKey:@"result"] objectForKey:@"trust_degree"] floatValue]];
        startView.frame = CGRectMake(150.0, -5.0, 150, 20);
        [self.view.validTitleView addSubview:startView];
        
        //初始化私有数据
        self.view.publishType.text =[[methodResult objectForKey:@"result"] objectForKey:@"contact_type"];
        self.view.expectMoney.text =[[methodResult objectForKey:@"result"] objectForKey:@"rent"];
        self.view.payType.text =[[methodResult objectForKey:@"result"] objectForKey:@"payment"];
        self.view.rentType.text =[[methodResult objectForKey:@"result"] objectForKey:@"rent_type"];
        self.view.area.text =[[methodResult objectForKey:@"result"] objectForKey:@"area"];
        self.view.decorate.text =[[methodResult objectForKey:@"result"] objectForKey:@"decorate"];
        self.view.base.text =[[methodResult objectForKey:@"result"] objectForKey:@"base"];
        self.view.roomType.text =[[methodResult objectForKey:@"result"] objectForKey:@"house_type"];
        self.view.direction.text =[[methodResult objectForKey:@"result"] objectForKey:@"direction"];
        self.view.floor.text =[[methodResult objectForKey:@"result"] objectForKey:@"floor"];
        self.view.houseType.text =[[methodResult objectForKey:@"result"] objectForKey:@"house"];
       
        

 
        if([[[[methodResult objectForKey:@"result"] objectForKey:@"isCollect"] stringValue] isEqualToString:@"1"]){
            self.followId = [[methodResult objectForKey:@"result"] objectForKey:@"collectId"];
            NSLog(@"%@",self.followId);
            
            self.navigationItem.rightBarButtonItem=self.collectedButton;
        }else{
            self.navigationItem.rightBarButtonItem=self.collectButton;
            
        }
        
        [self.loadingView removeFromSuperview];
        
    };
    [self RPCUseClass:@"RentResources" callMethodName:@"getSingleInfo" withParameters:condition onCompletion:completionHandler];

}

- (void)loadView{
    self.view = [[RentInfo alloc] init];
    self.typeId = @"2";

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"出租详情"];
 
}


@end