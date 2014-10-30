//
//  GlobalInfoViewController.h
//  weChat
//
//  Created by apple on 14-9-29.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//


#import "GlobalViewController.h"
#import "GlobalInfo.h"
#import "LoadingView.h"

@interface GlobalInfoViewController : GlobalViewController<KIImagePagerDelegate, KIImagePagerDataSource,UIScrollViewDelegate,UIAlertViewDelegate>
@property (nonatomic) GlobalInfo *view;
@property (nonatomic) NSString *showId;
@property (nonatomic) NSString *typeId;

@property (nonatomic) NSString *followId;

@property (nonatomic) LoadingView *loadingView;
@property (nonatomic) UIBarButtonItem *collectButton;
@property (nonatomic) UIBarButtonItem *collectedButton;

- (id)initWithId:(NSString*)showID;
@property (strong, nonatomic) NSMutableArray *photoArray;
@end