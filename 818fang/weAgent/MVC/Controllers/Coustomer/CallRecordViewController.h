//
//  CallRecordViewController.h
//  weChat
//
//  Created by apple on 14-9-29.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//
#import "GlobalViewController.h"
#import "CallRecord.h"
@interface CallRecordViewController : GlobalViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic) CallRecord *view;
@end
