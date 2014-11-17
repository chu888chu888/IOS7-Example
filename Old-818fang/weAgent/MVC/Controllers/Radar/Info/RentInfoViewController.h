//
//  RentInfoViewController.h
//  weChat
//
//  Created by apple on 14-9-1.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

//#import "QMBParallaxScrollViewController.h"
//#import "PhotoBrowserViewController.h"
//#import "RentInfoScrollViewController.h"
//#import "GlobalViewController.h"
//
//@interface RentInfoViewController : QMBParallaxScrollViewController<QMBParallaxScrollViewControllerDelegate>
//
//@property (nonatomic) NSString* showId;
//- (id)initWithId:(NSString*)showID;
//
//@end
#import "GlobalInfoViewController.h"
#import "RentInfo.h"

@interface RentInfoViewController : GlobalInfoViewController
@property (nonatomic) RentInfo *view;



@end
