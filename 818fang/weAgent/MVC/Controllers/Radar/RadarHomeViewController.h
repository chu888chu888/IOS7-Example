//
//  RadarHomeViewController.h
//  weChat
//
//  Created by apple on 14-9-1.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "GlobalViewController.h"
#import "Radar.h"

@interface RadarHomeViewController : GlobalViewController<KIImagePagerDelegate, KIImagePagerDataSource>
@property (nonatomic) Radar *view;


@end
